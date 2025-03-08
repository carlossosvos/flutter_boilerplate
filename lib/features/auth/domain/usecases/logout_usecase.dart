// lib/domain/usecases/login_usecase.dart

import 'package:flutter_boilerplate/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  LogoutUseCase(this.authRepository);

  Future<void> execute() {
    return authRepository.logout();
  }
}
