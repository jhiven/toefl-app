import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final SupabaseClient _supabaseClient;

  AuthenticationCubit(this._supabaseClient) : super(AuthenticationInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final loading = BotToast.showLoading();
    try {
      emit(AuthenticationLoading());

      await _supabaseClient.auth.signInWithPassword(
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

      final AuthResponse res = await _supabaseClient.auth.signUp(
        password: password,
        email: email,
      );

      if (res.user != null) {
        await _supabaseClient.from('users').insert({
          'id': res.user!.id,
          'name': name,
          'email': res.user!.email!,
        });

        emit(
          AuthenticationRegisterSuccess(),
        );
      } else {
        emit(const AuthenticationFailed(errorMsg: 'User is null'));
      }
    } catch (e) {
      emit(
        AuthenticationFailed(errorMsg: e.toString()),
      );
    } finally {
      loading();
    }
  }

  void logout() async {
    await _supabaseClient.auth.signOut();
  }
}
