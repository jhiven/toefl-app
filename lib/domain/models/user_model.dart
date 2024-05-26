import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String userId;
  final String name;
  final String email;
  final int testRemaining;
  final bool isAdmin;

  const UserModel({
    required this.name,
    required this.email,
    required this.testRemaining,
    required this.isAdmin,
    required this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      testRemaining: json['test_remaining'] as int,
      isAdmin: json['is_admin'] as bool,
      userId: json['id'] as String,
    );
  }

  @override
  List<Object?> get props => [name, email, testRemaining, isAdmin, userId];
}
