import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/order/models/order_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class StoreOrderViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final UserDataService _userDataService;
  final LocalStorageService _localStorageService;
  final Dio _dio;

  List<OrderModel> orders = [];

  StoreOrderViewModel(this._navigationService, this._dio, this._snackbarService,
      this._userDataService, this._localStorageService);

  Future<void> getOrders() async {
    setBusy(true);
    try {
      var response = await _dio.get("/order/ofStore");
      orders = (response.data as List)
          .map<OrderModel>((e) => OrderModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusy(false);
  }

  shipOrder(String id) async {
    print(id);
    try {
      setBusy(true);
      var response = await _dio.post("/order/$id/shipped");
      getOrders();
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusy(false);
  }

  initialise() {
    getOrders();
  }
}
