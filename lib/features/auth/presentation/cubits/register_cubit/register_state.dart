part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final AuthResponse authResponse;

  RegisterSuccessState(this.authResponse);
}

final class RegisterFailureState extends RegisterState {
  final String errMessage;

  RegisterFailureState(this.errMessage);
}
