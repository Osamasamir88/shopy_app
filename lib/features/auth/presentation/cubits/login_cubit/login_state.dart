part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final AuthResponse authResponse;

  LoginSuccessState(this.authResponse);
}

final class LoginFailureState extends LoginState {
  final String errMessage;

  LoginFailureState(this.errMessage);
}
