import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class DioErrorService {
  final Dio _dio;
  final SnackbarService _snackbarService;
  DioErrorService(this._dio, this._snackbarService);

  void apiCall(tryStatements) {
    try {
      tryStatements;
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response!.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
  }
}
