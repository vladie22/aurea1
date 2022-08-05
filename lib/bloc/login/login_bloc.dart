import 'dart:html';

import 'package:aurea1/auth/auth_repository.dart';
import 'package:aurea1/auth/form_submission_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  final LoginState state;
  LoginBloc({required this.authRepo, required this.state})
      : super(LoginState()) {
    on<LoginMailChangeEvent>((event, emit) async {});
    on<LoginPasswordChangeEvent>((event, emit) async {});
    on<LoginSubmittedEvent>((event, emit) async {});

    // on<LoginState>(LoginEvent event) async* {
    //   emit(state.mail)
    //   if (event is LoginMailChange) {
    //     yield state.copyWith(mail: event.mail);
    //   } else if (event is LoginPasswordChange) {
    //     yield state.copyWith(password: event.password);
    //   } else if (event is LoginSubmitted) {
    //     yield state.copyWith(formStatus: FormSubmitting());
    //     try {
    //       await authRepo.login(state.mail, state.password);
    //       yield state.copyWith(formStatus: SubmissionSuccess());
    //     } on Exception catch (e) {
    //       yield state.copyWith(formStatus: SubmissionFailed(e));
    //     }
    //   }
    // }
  }
}
