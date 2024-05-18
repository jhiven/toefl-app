part of 'test_packet_cubit.dart';

sealed class TestPacketState extends Equatable {
  const TestPacketState();

  @override
  List<Object> get props => [];
}

final class TestPacketInitial extends TestPacketState {}

final class TestPacketAnswering extends TestPacketState {
  final TestPacketModel packet;
  final TestSectionModel currentSection;
  final int currentSectionIdx;
  final int listeningScore;
  final int structureScore;
  final int readingScore;

  const TestPacketAnswering({
    required this.packet,
    required this.currentSection,
    this.currentSectionIdx = 0,
    this.listeningScore = 0,
    this.structureScore = 0,
    this.readingScore = 0,
  });

  TestPacketAnswering copyWith({
    TestPacketModel? packet,
    TestSectionModel? currentSection,
    int? currentSectionIdx,
    int? listeningScore,
    int? structureScore,
    int? readingScore,
  }) {
    return TestPacketAnswering(
      packet: packet ?? this.packet,
      currentSection: currentSection ?? this.currentSection,
      currentSectionIdx: currentSectionIdx ?? this.currentSectionIdx,
      listeningScore: listeningScore ?? this.listeningScore,
      structureScore: structureScore ?? this.structureScore,
      readingScore: readingScore ?? this.readingScore,
    );
  }

  @override
  List<Object> get props => [
        packet,
        currentSection,
        currentSectionIdx,
        listeningScore,
        structureScore,
        readingScore,
      ];
}

final class TestPacketError extends TestPacketState {
  final String errorMsg;

  const TestPacketError({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

final class TestPacketDone extends TestPacketState {
  final int listeningScore;
  final int structureScore;
  final int readingScore;
  final int totalScore;

  const TestPacketDone({
    required this.listeningScore,
    required this.structureScore,
    required this.readingScore,
    required this.totalScore,
  });

  @override
  List<Object> get props => [
        listeningScore,
        structureScore,
        readingScore,
        totalScore,
      ];
}
