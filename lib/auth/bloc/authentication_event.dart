part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final UserModel userModel;

  const LoggedIn({required this.userModel});

  @override
  List<Object> get props => [userModel];

  @override
  String toString() =>
      'LoggedIn { user: $userModel.email.toString(), name: $userModel.name.toString() }';
}

class LoggedOut extends AuthenticationEvent {}
