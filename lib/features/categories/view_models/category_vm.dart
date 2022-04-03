import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/categories/models/category.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class CategoryViewModel extends BaseViewModel {
  List<CategoryModel> selectedCategories = [];
  List<CategoryModel> categoryResponse = [];

  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final UserDataService _userDataService;
  final LocalStorageService _localStorageService;
  final Dio _dio;

  CategoryViewModel(this._navigationService, this._dio, this._snackbarService,
      this._userDataService, this._localStorageService);

  void initialise() {
    getCategory();
  }

  void onSelectionChanged(List<CategoryModel> value) {
    selectedCategories = value;
  }

  getCategory() async {
    setBusy(true);
    try {
      var response = await _dio.get("/storecat/sendCategory");
      categoryResponse = response.data
          .map<CategoryModel>((item) => CategoryModel.fromJson(item))
          .toList();
      selectedCategories = categoryResponse
          .where(
              (element) => _userDataService.categories.contains(element.value))
          .toList();
      setBusy(false);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusy(false);
  }

  onCategorySave() async {
    setBusy(true);
    try {
      List<String> storeCategories = selectedCategories
          .map((categoryModel) => categoryModel.value)
          .toList();
      var response = await _dio
          .post("/storecat/${_userDataService.storeId}/category", data: {
        'category': storeCategories,
      });
      setBusy(false);

      print(_localStorageService.read("token"));

      print(storeCategories);
      _snackbarService.showSnackbar(
        message: response.data['message'],
        duration: Duration(seconds: 1),
      );
      Future.delayed(const Duration(seconds: 2), () {
        _navigationService.replaceWith(Routes.uploadLogoViewRoute);
      });
    } on DioError catch (e) {
      setBusy(false);
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        // String message = "";
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
  }
}
