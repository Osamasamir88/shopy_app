// import 'package:dio/dio.dart';


// // جاهز لاي بروجكت جديد ApiService
// class ApiService {
//   final Dio _dio;

//   ApiService(this._dio);

//   // GET Request (Supports both Map and List responses)
//   Future<dynamic> get({
//     required String endpoint,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     final response = await _dio.get(
//       endpoint,
//       queryParameters: queryParameters,
//     );
//     return response.data;
//   }

//   // POST Request
//   Future<dynamic> post({
//     required String endpoint,
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     final response = await _dio.post(
//       endpoint,
//       data: data,
//       queryParameters: queryParameters,
//     );
//     return response.data;
//   }

//   // PUT Request
//   Future<dynamic> put({
//     required String endpoint,
//     dynamic data,
//   }) async {
//     final response = await _dio.put(
//       endpoint,
//       data: data,
//     );
//     return response.data;
//   }

//   // DELETE Request
//   Future<dynamic> delete({
//     required String endpoint,
//     dynamic data,
//   }) async {
//     final response = await _dio.delete(
//       endpoint,
//       data: data,
//     );
//     return response.data;
//   }
// }