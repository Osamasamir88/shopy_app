import 'package:dio/dio.dart';
import 'package:shopy_app/features/auth/data/models/auth_response.dart';
import 'package:shopy_app/features/auth/data/models/login_request_body.dart';
import 'package:shopy_app/features/auth/data/models/register_request_body.dart';

// جاهز لاي بروجكت جديد ApiService
class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // 1. Endpoint التسجيل في Strapi
  Future<AuthResponse> register(RegisterRequestBody registerRequestBody) async {
    final response = await _dio.post(
      '/api/auth/local/register',
      data: registerRequestBody.toJson(),
    );

    return AuthResponse.fromJson(response.data);
  }

  // 2. Endpoint تسجيل الدخول في Strapi
  Future<AuthResponse> login(LoginRequestBody loginRequestBody) async {
    final response = await _dio.post(
      '/api/auth/local',
      data: loginRequestBody.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<Map<String, dynamic>> get({required String endpoint}) async {
  var response = await _dio.get('/$endpoint');
  return response.data;
}
}
