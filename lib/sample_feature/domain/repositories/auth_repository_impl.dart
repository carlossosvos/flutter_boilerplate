// lib/data/repositories/auth_repository_impl.dart
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_boilerplate/sample_feature/domain/repositories/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient supabaseClient;

  AuthRepositoryImpl(this.supabaseClient);

  @override
  Future<void> login(String email, String password) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session == null) {
        throw Exception('Login failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> register(String email, String password) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception('Registration failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
