import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/data/repository/auth_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepository _authRepository;

  AuthenticationCubit(this._authRepository) : super(AuthenticationInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final loading = BotToast.showLoading();
    try {
      emit(AuthenticationLoading());

      await _authRepository.login(
        password: password,
        email: email,
      );

      emit(
        AuthenticationLoginSucess(),
      );
    } catch (e) {
      emit(
        AuthenticationFailed(errorMsg: e.toString()),
      );
    } finally {
      loading();
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final loading = BotToast.showLoading();
    try {
      emit(AuthenticationLoading());

      await _authRepository.register(
        password: password,
        email: email,
        name: name,
      );

      emit(
        AuthenticationRegisterSuccess(),
      );
    } catch (e) {
      emit(
        AuthenticationFailed(errorMsg: e.toString()),
      );
    } finally {
      loading();
    }
  }

  void logout() async {
    await _authRepository.logout();
  }
}
