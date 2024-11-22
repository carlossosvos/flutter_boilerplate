import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_boilerplate/auth/presentation/cubits/auth_state.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (listenerContext, state) {
          if (state is AuthSuccess) {
            debugPrint("SUCCESSFUL LOGIN");
            GoRouter.of(listenerContext)
                .go('/'); // Navigate to the home page on success
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(listenerContext).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }
        },
        builder: (
          authContext,
          authState,
        ) =>
            Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ScreenLayout(
            children: [
              if (authState is AuthLoading)
                Center(child: CircularProgressIndicator())
              else ...[
                Spacer(),
                TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email')),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    context.read<AuthCubit>().login(email, password);
                  },
                  child: Text('Login'),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    GoRouter.of(authContext).go('/register');
                  },
                  child: Text('Register'),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
