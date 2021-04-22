import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class ProfileSetupViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  ProfileSetupViewModel(this._navigationService);

  onButtonClick() {
    _navigationService.navigateTo(Routes.categoryViewRoute);
  }
}
