import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy_app/Core/api/api_service.dart';
import 'package:shopy_app/Core/errors/failure.dart';
import 'package:shopy_app/features/auth/data/models/auth_response.dart';
import 'package:shopy_app/features/auth/data/models/login_request_body.dart';
import 'package:shopy_app/features/auth/data/models/register_request_body.dart';
import 'package:shopy_app/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  @override
  Future<Either<Failure, AuthResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(
    RegisterRequestBody registerRequestBody,
  ) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
