import 'package:toefl_app/data/provider/supabase_database.dart';
import 'package:toefl_app/domain/models/synonym.dart';

class SynonymRepository {
  final SupabaseDatabase _supabaseDatabase;

  SynonymRepository({
    required SupabaseDatabase supabaseDatabase,
  }) : _supabaseDatabase = supabaseDatabase;

  Future<List<SynonymModel>> getSynonymData() async {
    return await _supabaseDatabase.getSynonym();
  }
}