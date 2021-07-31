import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matel_login1/auth/bloc/authentication_bloc.dart';
import 'package:matel_login1/auth/repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  }) : super(LoginInitial());

  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginInitial();

      try {
        final user = await userRepository.authenticate(
            email: event.email, password: event.password);

        authenticationBloc.add(LoggedIn(userModel: user));
        yield LoginInitial();
      } catch (e) {
        yield LoginFailure(error: e.toString());
      }
    }
  }
}
