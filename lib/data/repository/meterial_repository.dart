import 'package:toefl_app/data/provider/supabase_database.dart';
import 'package:toefl_app/domain/models/material.dart';

class MaterialRepository{
  final SupabaseDatabase _supabaseDatabase;

  MaterialRepository({
    required SupabaseDatabase supabaseDatabase,
  }) : _supabaseDatabase = supabaseDatabase;

  Future<List<MaterialModel>> getMaterial(int id) async {
    return await _supabaseDatabase.getMaterialByTypeId(id);
  }
}