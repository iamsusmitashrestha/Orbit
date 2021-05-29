import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class StoreProfileViewModel extends BaseViewModel {
  final NavigationService navigationService;
  final UserDataService userDataService;

  StoreProfileViewModel(this.navigationService, this.userDataService);

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
