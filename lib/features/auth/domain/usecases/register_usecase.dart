// lib/domain/usecases/register_usecase.dart
import 'package:flutter_boilerplate/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  Future<void> execute({
    required String email,
    required String password,
  }) {
    return authRepository.register(email, password);
  }
}
