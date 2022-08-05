part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginMailChangeEvent extends LoginEvent {
  LoginMailChangeEvent(this.mail);
  final String mail;
}

class LoginPasswordChangeEvent extends LoginEvent {
  const LoginPasswordChangeEvent(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

class LoginSubmittedEvent extends LoginEvent {}
