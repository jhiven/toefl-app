import 'package:toefl_app/data/provider/supabase_database.dart';
import 'package:toefl_app/domain/models/user_model.dart';

class AuthRepository {
  final SupabaseDatabase _supabaseDatabase;

  AuthRepository({
    required SupabaseDatabase supabaseDatabase,
  }) : _supabaseDatabase = supabaseDatabase;

  Future<void> logout() async {
    await _supabaseDatabase.logout();
  }

  Future<void> register({
    required String password,
    required String email,
    required String name,
  }) async {
    await _supabaseDatabase.register(
      password: password,
      email: email,
      name: name,
    );
  }

  Future<UserModel> getUser() async {
    return await _supabaseDatabase.getUser();
  }

  Future<void> login({
    required String password,
    required String email,
  }) async {
    await _supabaseDatabase.login(
      password: password,
      email: email,
    );
  }
}
