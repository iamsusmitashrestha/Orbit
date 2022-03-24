import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class RoleSelectionViewModel extends BaseViewModel {
  String role = "user";
  final LocalStorageService localStorageService;

  final NavigationService _navigationService;
  RoleSelectionViewModel(this._navigationService, this.localStorageService);

  void onRoleChanged(String? value) {
    role = value!;
    notifyListeners();
  }

  void onButtonClick() {
    localStorageService.write("role", role);
    _navigationService.replaceWith(Routes.signinViewRoute);
  }
}
