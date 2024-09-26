// lib/domain/usecases/register_usecase.dart
import '../repositories/auth_repository.dart';

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
