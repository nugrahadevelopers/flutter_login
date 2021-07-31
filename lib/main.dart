import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matel_login1/auth/bloc/authentication_bloc.dart';
import 'package:matel_login1/auth/common/loading_indicator.dart';
import 'package:matel_login1/auth/repository/user_repository.dart';
import 'package:matel_login1/auth/ui/home/home_page.dart';
import 'package:matel_login1/auth/ui/login/login_page.dart';
import 'package:matel_login1/auth/ui/splash/splash_page.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  final userRepository = UserRepository();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.userRepository}) : super(key: key);

  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return SplashPage();
          } else if (state is AuthenticationAuthenticated) {
            return HomePage();
          } else if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository);
          } else {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}
