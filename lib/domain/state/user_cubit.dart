import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toefl_app/domain/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SupabaseClient _supabaseClient;

  UserCubit(this._supabaseClient) : super(UserInitial());

  void getSession() async {
    final Session? session = _supabaseClient.auth.currentSession;

    if (session != null) {
      final List<Map<String, dynamic>> user = await _supabaseClient
          .from('users')
          .select()
          .eq('id', session.user.id);

      emit(
        UserFetchSucess(
          user: UserModel.fromJson(user.first),
          session: session,
        ),
      );
    } else {
      emit(UserNoSession());
    }
  }
}
