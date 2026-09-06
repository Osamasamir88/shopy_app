import 'package:dartz/dartz.dart';
import 'package:shopy_app/Core/errors/failure.dart';
import 'package:shopy_app/features/auth/data/models/auth_response.dart';
import 'package:shopy_app/features/auth/data/models/login_request_body.dart';
import 'package:shopy_app/features/auth/data/models/register_request_body.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> login(LoginRequestBody loginRequestBody);
  Future<Either<Failure, AuthResponse>> register(RegisterRequestBody registerRequestBody);
}
