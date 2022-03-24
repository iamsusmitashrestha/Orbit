import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class StoreProfileViewModel extends BaseViewModel {
  bool storeStatus = true;

  final NavigationService navigationService;
  final UserDataService userDataService;
  final SnackbarService _snackbarService;
  final LocalStorageService localStorageService;
  final Dio _dio;

  StoreProfileViewModel(this.navigationService, this.userDataService, this._dio,
      this.localStorageService, this._snackbarService);

  void initialise() {}

  storeStatusSelection() {
    storeStatus = !storeStatus;

    notifyListeners();
  }

  postStoreStatus() async {
    try {
      setBusy(true);
      storeStatusSelection();

      var response = await _dio.post(
        '/store/${userDataService.storeId}/storeStatus',
      );
      setBusy(false);
    } on DioError catch (e) {
      setBusy(false);

      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        if (e.response != null) {
          String message = e.response?.data['message'];
          _snackbarService.showSnackbar(message: message);
        }
      }
    }
  }

  logOut() {
    localStorageService.clear('token');
    navigationService.clearStackAndShow(Routes.splashViewRoute);
  }

  deleteStore() async {
    try {
      setBusy(true);
      var response = await _dio.delete("/user/deleteuser");
      _snackbarService.showSnackbar(
        message: response.data['message'],
        duration: Duration(seconds: 1),
      );
      localStorageService.clear('token');
      navigationService.replaceWith(Routes.splashViewRoute);

      setBusy(false);
    } on DioError catch (e) {
      setBusy(false);

      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        if (e.response != null) {
          String message = e.response?.data['message'];
          _snackbarService.showSnackbar(message: message);
        }
      }
    }
  }

  goToHomeView() {
    navigationService.navigateTo(Routes.homeViewRoute);
  }

  updateLogo() {
    navigationService.navigateTo(Routes.uploadLogoViewRoute);
  }

  goToInventory() {
    navigationService.navigateTo(Routes.inventoryViewRoute);
  }

  goToStoreDetails() {
    navigationService.navigateTo(Routes.storeDetailsViewRoute);
  }

  goToPaymentMethod() {
    navigationService.navigateTo(Routes.paymentMethodViewRoute);
  }

  goToCategories() {
    navigationService.navigateTo(Routes.categoryViewRoute);
  }

  goToSettings() {
    navigationService.navigateTo(Routes.settingsViewRoute);
  }
}
