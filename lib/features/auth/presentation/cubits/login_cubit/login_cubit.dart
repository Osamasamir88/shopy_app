import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopy_app/features/auth/data/models/auth_response.dart';
import 'package:shopy_app/features/auth/data/models/login_request_body.dart';
import 'package:shopy_app/features/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    // قبل ما نعمل تسجيل دخول نشيك الاول هل اليوزر دخل البيانات بشكل صحيح ولا لا
    if (!loginFormKey.currentState!.validate()) return;

    emit(LoginLoadingState());

    final response = await authRepo.login(
      LoginRequestBody(
        id: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    response.fold(
      (failure) => emit(LoginFailureState(failure.errMassage)),
      (authResponse) => emit(LoginSuccessState(authResponse)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
