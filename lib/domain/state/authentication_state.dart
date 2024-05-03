part of 'authentication_cubit.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationLoginSucess extends AuthenticationState {}

final class AuthenticationRegisterSuccess extends AuthenticationState {}

final class AuthenticationFailed extends AuthenticationState {
  final String errorMsg;

  const AuthenticationFailed({required this.errorMsg});

  @override
  List<Object?> get props => [errorMsg];
}
