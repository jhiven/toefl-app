part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserFetchSucess extends UserState {
  final UserModel user;
  final Session session;

  const UserFetchSucess({
    required this.user,
    required this.session,
  });

  @override
  List<Object> get props => [user, session];
}

final class UserFailed extends UserState {
  final String errorMsg;

  const UserFailed({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

final class UserNoSession extends UserState {}
