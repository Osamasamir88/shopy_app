// class DioFactory {
//   static Dio getDio() {
//     Dio dio = Dio(
//       BaseOptions(
//         baseUrl: ApiConstants.baseUrl,
//         connectTimeout: const Duration(seconds: 30),
//         receiveTimeout: const Duration(seconds: 30),
//       ),
//     );
//     // تقدر تضيف الـ Interceptors هنا
//     return dio;
//   }
// }