import 'package:dio/dio.dart';

abstract class Failure {
  final String errMassage;

  Failure(this.errMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMassage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  // التعامل مع استجابات السيرفر الخاطئة (400, 401, 404, 500...)
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else {
      return ServerFailure('Opps There was an Error!, Pull to Refresh 🔄️');
    }
  }
}
