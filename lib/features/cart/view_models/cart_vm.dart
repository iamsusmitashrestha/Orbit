import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/features/payment/payment_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class CartViewModel extends BaseViewModel {
  final Dio dio;
  final NavigationService navigationService;
  final SnackbarService snackbarService;
  Map<String, dynamic> cart = {};

  CartViewModel(this.snackbarService, this.dio, this.navigationService);

  initialise() {
    getCart();
  }

  getCart() async {
    setBusy(true);
    try {
      var response = await dio.get("/cart/getItems");
      cart = response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusy(false);
  }

  calculateTotalPrice() {}

  deleteCart(String id) async {
    setBusyForObject(cart[id], true);
    try {
      print("/cart/removeFromCart/$id");
      var response = await dio.patch("/cart/removeFromCart/$id");
      getCart();
      notifyListeners();
      // cart.remove(id);
      // notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = "";

        snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusyForObject(cart[id], false);
  }

  clearCart() async {
    try {
      var response = await dio.delete("/cart/clearCart");
      getCart();
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = "";

        snackbarService.showSnackbar(message: message.trim());
      }
    }
  }

  order(String storeId, String total) async {
    setBusy(true);
    try {
      var response = await dio.post("/order/$storeId");
      getCart();
      navigationService
          .navigateToView(PaymentView(storeId: storeId, total: total));
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = "";

        snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusy(false);
  }
}
