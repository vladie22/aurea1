import 'package:aurea1/auth/auth_repository.dart';
import 'package:aurea1/auth/form_submission_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aurea1/bloc/login/login_bloc.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/appBar.jpg",
                  fit: BoxFit.fitWidth,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 200),
              child: BlocProvider(
                create: (context) => LoginBloc(
                    authRepo: context.read<AuthRepository>(),
                    state: context.read<LoginState>()),
                child: _loginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_emailField(), _passwordField(), _loginButton()]),
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          style: TextStyle(fontSize: 15),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: const OutlineInputBorder(),
            hintText: "Ingresa tu mail",
          ),
          validator: (value) => null,
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginMailChangeEvent(mail: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          style: TextStyle(fontSize: 15),
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: const OutlineInputBorder(),
            hintText: "Ingresa tu contraseña",
          ),
          validator: (value) =>
              state.isValidPassword ? null : "Minimo 6 caracteres",
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginPasswordChangeEvent(password: value),
              ),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginSubmittedEvent());
                  }
                },
                child: Text("Iniciar Sesion"));
      },
    );
  }
}
