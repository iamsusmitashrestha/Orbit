import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/toast_service.dart';
import 'package:orbit/features/signup/views/role_selection_view.dart';
import 'package:stacked/stacked.dart';

@injectable
class RoleSelectionViewModel extends BaseViewModel {
  String role = "user";
  String email = "";
  String year = "";
  List<String> languages = ["English"];
  List<String> letters = ["A"];

  void initialise() {}

  void onLanguagesChanged(List<String> value) {
    languages = value;
  }

  void onLettersChanged(List<String> value) {
    languages = value;
  }

  final ToastService _toastService;
  RoleSelectionViewModel(this._toastService);

  void onRoleChanged(String? value) {
    role = value!;
    notifyListeners();
  }

  void onEmailChanged(String value) {
    email = value;
  }

  void onYearChanged(String value) {
    year = value;
  }

  void onButtonClick() {
    // _toastService.show("Wow", variant: ToastVariant.SUCCESS);
    _toastService.s("Error message");
  }
}
