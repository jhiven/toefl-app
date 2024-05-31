import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toefl_app/data/repository/test_repository.dart';
import 'package:toefl_app/domain/models/test_packet_model.dart';
import 'package:toefl_app/domain/models/test_question_model.dart';
import 'package:toefl_app/domain/models/test_section_model.dart';
import 'package:toefl_app/utils/score_env.dart';

part 'test_packet_state.dart';

class TestPacketCubit extends Cubit<TestPacketState> {
  final TestRepository _testRepository;

  TestPacketCubit(this._testRepository) : super(TestPacketInitial());

  void startTest() async {
    emit(const TestPacketLoading());
    final loading = BotToast.showLoading();
    try {
      // final TestPacketModel packet = await _testRepository.getRandomPacket();
      final TestPacketModel packet = await _testRepository.getPacketById(1);

      final TestSectionModel listeningSection = packet.listSection.firstWhere(
          (element) => element.sectionType == SectionType.listening);

      final List<TestQuestionModel> downloadedAudioList = await Future.wait(
          listeningSection.questionList
              .map((e) => _testRepository.downloadAudio(e))
              .toList());

      final newPacket = packet.copyWith(
          listSection: packet.listSection
              .map(
                (e) => e.sectionType == SectionType.listening
                    ? e.copyWith(questionList: downloadedAudioList)
                    : e,
              )
              .toList());
      log(newPacket.toString());

      await _testRepository.decrementTestRemaining();
      final int testRemaining = await _testRepository.getTestRemaining();

      if (testRemaining > 0) {
        emit(
          TestPacketAnswering(
            packet: newPacket,
            currentSection: newPacket.listSection.first,
          ),
        );
      } else {
        emit(const TestPacketError(errorMsg: 'Your test remaining is 0'));
      }
    } catch (e) {
      emit(TestPacketError(errorMsg: e.toString()));
      throw Exception(e.toString());
    } finally {
      loading();
    }
  }

  void calculateSectionScore({
    required SectionType sectionType,
    required int totalCorrect,
  }) {
    if (state is! TestPacketAnswering) {
      return emit(
        TestPacketError(
          errorMsg:
              'Can not calculate score for ${sectionType.name} because previous state was not success',
        ),
      );
    }

    final TestPacketAnswering tps = state as TestPacketAnswering;
    final ScoreEnv scores = ScoreEnv();

    switch (sectionType) {
      case SectionType.listening:
        final score = scores.listeningScore[totalCorrect];

        emit(
          tps.copyWith(
            listeningScore: (score * 10 / 3).floor(),
          ),
        );
      case SectionType.structure:
        final score = scores.structureScore[totalCorrect];

        emit(
          tps.copyWith(
            structureScore: (score * 10 / 3).floor(),
          ),
        );
      case SectionType.reading:
        final score = scores.readingScore[totalCorrect];

        emit(
          tps.copyWith(
            readingScore: (score * 10 / 3).floor(),
          ),
        );
      default:
        break;
    }
  }

  Future<void> nextSection() async {
    if (state is! TestPacketAnswering) {
      return emit(const TestPacketError(
        errorMsg:
            'Can not go to next section because previous state was not success',
      ));
    }

    final TestPacketAnswering tps = state as TestPacketAnswering;
    final int idx = tps.currentSectionIdx + 1;

    try {
      if (tps.currentSection.sectionType == SectionType.listening) {
        Directory dir = await getTemporaryDirectory();
        dir.deleteSync(recursive: true);
        dir.create();
      }
      emit(
        tps.copyWith(
          currentSection: tps.packet.listSection[idx],
          currentSectionIdx: idx,
        ),
      );
    } on RangeError catch (_) {
      final total = tps.listeningScore + tps.readingScore + tps.structureScore;

      emit(const TestPacketLoading());

      await _testRepository.insertHistory(
        listeningScore: tps.listeningScore,
        readingScore: tps.readingScore,
        structureScore: tps.structureScore,
        packetId: tps.packet.id,
      );

      emit(
        TestPacketDone(
          listeningScore: tps.listeningScore,
          structureScore: tps.structureScore,
          readingScore: tps.readingScore,
          totalScore: total,
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
