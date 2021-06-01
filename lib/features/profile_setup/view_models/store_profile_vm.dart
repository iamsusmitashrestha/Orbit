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
  final LocalStorageService localStorageService;
  final Dio _dio;

  StoreProfileViewModel(this.navigationService, this.userDataService, this._dio,
      this.localStorageService);

  void initialise() {}

  storeStatusSelection() {
    storeStatus = !storeStatus;

    notifyListeners();
  }

  logOut() {
    localStorageService.clear('token');
    navigationService.clearStackAndShow(Routes.splashViewRoute);
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
