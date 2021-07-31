import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matel_login1/auth/bloc/authentication_bloc.dart';
import 'package:matel_login1/auth/repository/user_repository.dart';
import 'package:matel_login1/auth/ui/login/bloc/login_bloc.dart';
import 'package:matel_login1/auth/ui/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.userRepository}) : super(key: key);

  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            userRepository: userRepository,
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
