part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.mail = '',
      this.password = '',
      this.status = FormzStatus.pure,
      this.error = ''});

  @override
  List<Object> get props => [mail, password, status, error];

  final String mail;
  final String password;
  final FormzStatus status;
  final String error;

  LoginState copyWith(
      {String? mail, String? password, FormzStatus? status, String? error}) {
    return LoginState(
        mail: mail ?? this.mail,
        password: password ?? this.password,
        status: status ?? this.status,
        error: error ?? this.error);
  }
}
