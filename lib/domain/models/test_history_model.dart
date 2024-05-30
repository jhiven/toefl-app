import 'package:equatable/equatable.dart';

class TestHistoryModel extends Equatable {
  final int packetId;
  final int listeningScore;
  final int structureScore;
  final int readingScore;
  final DateTime date;

  const TestHistoryModel({
    required this.packetId,
    required this.listeningScore,
    required this.structureScore,
    required this.readingScore,
    required this.date,
  });

  factory TestHistoryModel.fromJson(Map<String, dynamic> json) {
    return TestHistoryModel(
      packetId: json['packet_id'] as int,
      listeningScore: json['listening_score'] as int,
      structureScore: json['structure_score'] as int,
      readingScore: json['reading_score'] as int,
      date: DateTime.parse(json['created_at'] as String),
    );
  }

  @override
  List<Object?> get props => [
        packetId,
        listeningScore,
        structureScore,
        readingScore,
        date,
      ];
}
