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
  final Dio _dio;

  CategoryViewModel(this._navigationService, this._dio, this._snackbarService,
      this._userDataService);

  void initialise() {
    getCategory();
  }

  getCategory() async {
    setBusy(true);
    try {
      var response = await _dio.get("/storecat/sendCategory");
      categoryResponse = response.data
          .map<CategoryModel>((item) => CategoryModel.fromJson(item))
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
  }

  void onSelectionChanged(List<CategoryModel> value) {
    selectedCategories = value;
  }

  onCategorySave() async {
    setBusy(true);
    try {
      List<String> categories = selectedCategories
          .map((categoryModel) => categoryModel.value)
          .toList();
      var response = await _dio
          .post("/storecat/${_userDataService.storeId}/category", data: {
        'category': categories,
      });
      _navigationService.navigateTo(Routes.uploadLogoViewRoute);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response!.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusy(false);
  }
}
