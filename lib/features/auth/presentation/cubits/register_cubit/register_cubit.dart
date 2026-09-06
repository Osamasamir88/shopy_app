import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:shopy_app/features/auth/data/models/auth_response.dart';
import 'package:shopy_app/features/auth/data/models/register_request_body.dart';
import 'package:shopy_app/features/auth/data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  final registerFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> emitRegisterState() async {
    if (!registerFormKey.currentState!.validate()) return;

    emit(RegisterLoadingState());

    final response = await authRepo.register(
      RegisterRequestBody(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    response.fold(
      (failure) => emit(RegisterFailureState(failure.errMassage)),
      (authResponse) => emit(RegisterSuccessState(authResponse)),
    );
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
