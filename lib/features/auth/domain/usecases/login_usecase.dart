// lib/domain/usecases/login_usecase.dart

import 'package:flutter_boilerplate/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<void> execute({
    required String email,
    required String password,
  }) {
    return authRepository.login(email, password);
  }
}
