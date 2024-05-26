import 'package:toefl_app/data/provider/supabase_database.dart';
import 'package:toefl_app/domain/models/material_question.dart';


class ExampleRepository{
  final SupabaseDatabase _supabaseDatabase;

  ExampleRepository({
    required SupabaseDatabase supabaseDatabase,
  }) : _supabaseDatabase = supabaseDatabase;

  Future<MaterialQuestionModel> getQuestion(int id) async {
    return await _supabaseDatabase.getQuestionById(id);
  }
}