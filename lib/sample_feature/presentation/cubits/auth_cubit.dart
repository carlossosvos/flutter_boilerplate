// lib/presentation/cubit/auth_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_boilerplate/sample_feature/domain/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/sample_feature/domain/usecases/login_usecase.dart';
import 'package:flutter_boilerplate/sample_feature/domain/usecases/logout_usecase.dart';
import 'package:flutter_boilerplate/sample_feature/domain/usecases/register_usecase.dart';
import 'package:injectable/injectable.dart';

import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRepository,
  }) : super(AuthInitial());

  final AuthRepository authRepository;

  Future<void> login(String email, String password) async {
    final LoginUseCase loginUseCase = LoginUseCase(authRepository);
    emit(AuthLoading());
    try {
      await loginUseCase.execute(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(String email, String password) async {
    final RegisterUseCase registerUseCase = RegisterUseCase(authRepository);
    emit(AuthLoading());
    try {
      await registerUseCase.execute(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    final LogoutUseCase logoutUseCase = LogoutUseCase(authRepository);
    await logoutUseCase.execute();
    emit(AuthInitial()); // Clear authentication state
  }
}
