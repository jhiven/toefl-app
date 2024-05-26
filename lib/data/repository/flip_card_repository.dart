import 'package:toefl_app/data/provider/supabase_database.dart';
import 'package:toefl_app/domain/models/flip_card.dart';

class FlipCardRepository {
  final SupabaseDatabase _supabaseDatabase;

  FlipCardRepository({
    required SupabaseDatabase supabaseDatabase,
  }) : _supabaseDatabase = supabaseDatabase;

  Future<List<FlipCardModel>> getFlipCardWordData() async {
    return await _supabaseDatabase.getFlipCardWord();
  }
}