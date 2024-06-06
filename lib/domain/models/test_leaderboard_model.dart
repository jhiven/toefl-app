import 'package:equatable/equatable.dart';

class TestLeaderboardModel extends Equatable {
  final String userId;
  final int listeningScore;
  final int readingScore;
  final int structureScore;
  final int totalScore;
  final String name;
  final DateTime date;

  const TestLeaderboardModel({
    required this.userId,
    required this.listeningScore,
    required this.readingScore,
    required this.structureScore,
    required this.totalScore,
    required this.name,
    required this.date,
  });

  factory TestLeaderboardModel.fromJson(Map<String, dynamic> json) {
    return TestLeaderboardModel(
      userId: json['user_id'] as String,
      listeningScore: json['listening_score'] as int,
      readingScore: json['reading_score'] as int,
      structureScore: json['structure_score'] as int,
      totalScore: json['total_score'] as int,
      name: json['users']['name'] as String,
      date: DateTime.parse(json['created_at'] as String),
    );
  }

  @override
  List<Object> get props => [
        userId,
        readingScore,
        listeningScore,
        structureScore,
        totalScore,
        name,
        date,
      ];
}
