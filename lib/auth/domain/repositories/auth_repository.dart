// lib/domain/repositories/auth_repository.dart
abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
}
