import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/data/repository/test_repository.dart';
import 'package:toefl_app/domain/models/test_packet_model.dart';
import 'package:toefl_app/domain/models/test_section_model.dart';
import 'package:toefl_app/utils/score_env.dart';

part 'test_packet_state.dart';

class TestPacketCubit extends Cubit<TestPacketState> {
  final TestRepository _testRepository;

  TestPacketCubit(this._testRepository) : super(TestPacketInitial());

  void startTest(int userId) async {
    try {
      // final TestPacketModel packet = await _testRepository.getRandomPacket();
      final TestPacketModel packet = await _testRepository.getPacketById(1);

      // await _testRepository.decrementTestRemaining(userId);

      emit(
        TestPacketAnswering(
          packet: packet,
          currentSection: packet.listSection.first,
        ),
      );
    } catch (e) {
      emit(TestPacketError(errorMsg: e.toString()));
      throw Exception(e.toString());
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
    late final void Function()? loading;

    try {
      emit(
        tps.copyWith(
          currentSection: tps.packet.listSection[idx],
          currentSectionIdx: idx,
        ),
      );
      loading = null;
    } on RangeError catch (_) {
      final total = tps.listeningScore + tps.readingScore + tps.structureScore;

      loading = BotToast.showLoading();

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
    } finally {
      if (loading != null) loading();
    }
  }
}
