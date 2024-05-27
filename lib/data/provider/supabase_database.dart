import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toefl_app/domain/models/test_history_model.dart';
import 'package:toefl_app/domain/models/test_leaderboard_model.dart';
import 'package:toefl_app/domain/models/flip_card.dart';
import 'package:toefl_app/domain/models/material.dart';
import 'package:toefl_app/domain/models/material_question.dart';
import 'package:toefl_app/domain/models/pick_word.dart';
import 'package:toefl_app/domain/models/synonym.dart';
import 'package:toefl_app/domain/models/test_packet_model.dart';
import 'package:toefl_app/domain/models/user_model.dart';

class SupabaseDatabase {
  final SupabaseClient _supabaseClient;
  SupabaseDatabase({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  Future<void> logout() async {
    try {
      await _supabaseClient.auth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> register({
    required String password,
    required String email,
    required String name,
  }) async {
    try {
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
      } else {
        throw Exception('User is null');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> login({
    required String password,
    required String email,
  }) async {
    try {
      await _supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel> getUser() async {
    try {
      final Session? session = _supabaseClient.auth.currentSession;
      if (session != null) {
        final Map<String, dynamic> user = await _supabaseClient
            .from('users')
            .select()
            .eq('id', session.user.id)
            .single();
        return UserModel.fromJson(user);
      } else {
        throw Exception('There is no user logged in');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> getTestRemaining() async {
    try {
      final UserModel user = await getUser();
      return user.testRemaining;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TestPacketModel> getPacketById(int packetId) async {
    try {
      final Map<String, dynamic> data = await _supabaseClient
          .from('test_packet')
          .select(
            'id, name, test_question(question, text, url, type_id, test_answer(answer, is_correct))',
          )
          .eq('id', packetId)
          .single();

      return TestPacketModel.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TestPacketModel> getRandomPacket() async {
    try {
      final Map<String, dynamic> packetId = await _supabaseClient.rpc(
        'random_packet_id',
        params: {'auth_id': _supabaseClient.auth.currentUser!.id},
      );

      return await getPacketById(packetId['id']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> decrementTestRemaining() {
    return _supabaseClient.rpc(
      'decrement_test_remaining',
      params: {'user_id': _supabaseClient.auth.currentUser!.id},
    );
  }

  Future<void> insertHistory({
    required int packetId,
    required int listeningScore,
    required int readingScore,
    required int structureScore,
  }) async {
    final data = {
      'packet_id': packetId,
      'user_id': _supabaseClient.auth.currentUser!.id,
      'listening_score': listeningScore,
      'reading_score': readingScore,
      'structure_score': structureScore,
    };

    try {
      await _supabaseClient.from('test_history').insert(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<TestHistoryModel>> getHistory({
    required String userId,
  }) async {
    try {
      final data = await _supabaseClient
          .from('test_history')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return data.map((e) => TestHistoryModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<TestLeaderboardModel>> getLeaderboard() async {
    try {
      final data = await _supabaseClient
          .from('test_leaderboard')
          .select('*, users(name)');

      return data.map((e) => TestLeaderboardModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<MaterialModel>> getMaterialByTypeId(int id) async {
    try {
      final List<dynamic> data = await _supabaseClient
          .from('material')
          .select('id, title, content')
          .eq('modul_id', id);
      return data.map((json) => MaterialModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MaterialQuestionModel> getQuestionById(int id) async {
    try {
      final Map<String, dynamic> data = await _supabaseClient
          .from('example_question')
          .select(' question, url, example_answer(answer, value)')
          .eq('material_id', id)
          .single();
      return MaterialQuestionModel.fromJson(json: data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SynonymModel>> getSynonym() async {
    try {
      final List<dynamic> allData =
          await _supabaseClient.from('synonym').select('word1, word2');
      final List<dynamic> randomData = allData;
      randomData.shuffle(); // Shuffle the list
      final List<dynamic> data = randomData.take(4).toList();
      return data.map((json) => SynonymModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<PickWordModel>> getPickWord() async {
    try {
      final List<dynamic> allData =
          await _supabaseClient.from('pick_word').select('word, type');
      final List<dynamic> randomData = allData;
      randomData.shuffle();
      final List<dynamic> data = randomData.take(8).toList();
      return data.map((json) => PickWordModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FlipCardModel>> getFlipCardWord() async {
    try {
      final List<dynamic> allData = await _supabaseClient
          .from('flipcards')
          .select('front_side, back_side, vocab_translation');
      final List<dynamic> randomData = allData;
      randomData.shuffle();
      final List<dynamic> data = randomData.take(5).toList();
      return data.map((json) => FlipCardModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
