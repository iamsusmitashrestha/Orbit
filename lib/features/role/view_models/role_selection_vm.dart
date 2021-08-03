import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class RoleSelectionViewModel extends BaseViewModel {
  String role = "user";

  final NavigationService _navigationService;
  RoleSelectionViewModel(this._navigationService);

  void onRoleChanged(String? value) {
    role = value!;
    notifyListeners();
  }

  void onButtonClick() {
    role == "user"
        ? _navigationService.replaceWith(Routes.homeViewRoute)
        : _navigationService.replaceWith(Routes.signinViewRoute);
  }
}
