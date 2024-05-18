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

  Future<TestPacketModel> getRandomPacket() async {
    return await _supabaseDatabase.getRandomPacket();
  }

  Future<void> decrementTestRemaining(int userId) {
    return _supabaseDatabase.decrementTestRemaining(userId);
  }

  Future<void> insertHistory({
    required int packetId,
    required int listeningScore,
    required int readingScore,
    required int structureScore,
  }) async {
    return await _supabaseDatabase.insertHistory(
      packetId: packetId,
      listeningScore: listeningScore,
      readingScore: readingScore,
      structureScore: structureScore,
    );
  }
}
