import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/data/repository/test_repository.dart';
import 'package:toefl_app/domain/models/test_packet_model.dart';
import 'package:toefl_app/domain/models/test_section_model.dart';

part 'test_packet_state.dart';

class TestPacketCubit extends Cubit<TestPacketState> {
  final TestRepository _testRepository;

  TestPacketCubit(this._testRepository) : super(TestPacketInitial());

  void startTest(int userId) async {
    try {
      final TestPacketModel packet = await _testRepository.getPacketById(1);

      // await _testRepository.decrementTestRemaining(userId);

      emit(
        TestPacketAnswering(
          packet: packet,
          currentSection: packet.listSection.first,
          // status: TestPacketStatus.answering,
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

    switch (sectionType) {
      case SectionType.listening:
        final scoreList = [
          24,
          25,
          26,
          27,
          28,
          29,
          30,
          31,
          32,
          32,
          33,
          35,
          37,
          38,
          39,
          41,
          41,
          42,
          43,
          44,
          45,
          45,
          46,
          47,
          47,
          48,
          48,
          49,
          49,
          50,
          51,
          51,
          52,
          52,
          53,
          54,
          54,
          55,
          56,
          57,
          57,
          58,
          59,
          60,
          61,
          62,
          63,
          65,
          66,
          67,
          68
        ];

        final score = scoreList[totalCorrect];

        emit(
          tps.copyWith(
            listeningScore: score * 10 / 3,
          ),
        );
      case SectionType.structure:
        final scoreList = [
          20,
          20,
          21,
          22,
          23,
          25,
          26,
          27,
          29,
          31,
          33,
          35,
          36,
          37,
          38,
          40,
          40,
          41,
          42,
          43,
          44,
          45,
          46,
          47,
          48,
          49,
          50,
          51,
          52,
          53,
          54,
          55,
          56,
          57,
          58,
          60,
          61,
          63,
          65,
          67,
          68
        ];
        final score = scoreList[totalCorrect];

        emit(
          tps.copyWith(
            structureScore: score * 10 / 3,
          ),
        );
      case SectionType.reading:
        final scoreList = [
          21,
          22,
          23,
          23,
          24,
          25,
          26,
          27,
          28,
          28,
          29,
          30,
          31,
          32,
          34,
          35,
          36,
          37,
          38,
          39,
          40,
          41,
          42,
          43,
          43,
          44,
          45,
          46,
          46,
          47,
          48,
          48,
          49,
          50,
          51,
          52,
          52,
          53,
          54,
          54,
          55,
          56,
          57,
          58,
          59,
          60,
          61,
          63,
          65,
          66,
          67
        ];
        final score = scoreList[totalCorrect];

        emit(
          tps.copyWith(
            readingScore: score * 10 / 3,
          ),
        );
      default:
        break;
    }
  }

  void nextSection() {
    if (state is! TestPacketAnswering) {
      return emit(const TestPacketError(
        errorMsg:
            'Can not go to next section because previous state was not success',
      ));
    }

    final TestPacketAnswering tps = state as TestPacketAnswering;
    final int idx = tps.currentSectionIdx + 1;

    try {
      emit(
        tps.copyWith(
          currentSection: tps.packet.listSection[idx],
          currentSectionIdx: idx,
        ),
      );
    } on RangeError catch (_) {
      final total = tps.listeningScore + tps.readingScore + tps.structureScore;

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
