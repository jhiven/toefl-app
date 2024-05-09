import 'package:toefl_app/data/provider/supabase_database.dart';
import 'package:toefl_app/domain/models/test_packet_model.dart';

class TestRepository {
  final SupabaseDatabase _supabaseDatabase;

  TestRepository({
    required SupabaseDatabase supabaseDatabase,
  }) : _supabaseDatabase = supabaseDatabase;

  Future<TestPacketModel> getPacketById(int packetId) async {
    return await _supabaseDatabase.getPacketById(packetId);
  }

  Future<void> decrementTestRemaining(int userId) {
    return _supabaseDatabase.decrementTestRemaining(userId);
  }
}
