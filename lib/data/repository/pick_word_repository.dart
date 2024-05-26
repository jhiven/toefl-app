import 'package:toefl_app/data/provider/supabase_database.dart';
import 'package:toefl_app/domain/models/pick_word.dart';

class PickWordRepository {
  final SupabaseDatabase _supabaseDatabase;

  PickWordRepository({
    required SupabaseDatabase supabaseDatabase,
  }) : _supabaseDatabase = supabaseDatabase;

  Future<List<PickWordModel>> getPickWordData() async {
    return await _supabaseDatabase.getPickWord();
  }
}