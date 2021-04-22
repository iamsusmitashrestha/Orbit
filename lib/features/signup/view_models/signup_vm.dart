import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class SignupViewModel extends BaseViewModel {
  String email = "";
  String password = "";
  final NavigationService _navigationService;
  SignupViewModel(this._navigationService);

  onEmailChanged(value) {
    email = value;
  }

  onPasswordChanged(value) {
    email = value;
  }

  onButtonClick() {
    _navigationService.navigateTo(Routes.profileSetupViewRoute);
  }

  onLoginClick() {
    _navigationService.navigateTo(Routes.signinViewRoute);
  }
}
