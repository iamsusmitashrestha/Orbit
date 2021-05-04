import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class CategoryViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  CategoryViewModel(this._navigationService);
  List<String> selectedCategories = [];

  void onSelectionChanged(List<String> value) {
    selectedCategories = value;
  }

  onCategorySave() {
    _navigationService.navigateTo(Routes.uploadLogoViewRoute);
  }
}
