import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/categories/models/category.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  List<CategoryModel> categoryResponse = [];
  CategoryModel? selectedCategory;
  num? distance;

  final Dio _dio;
  final UserDataService userDataService;
  final SnackbarService _snackbarService;
  HomeViewModel(this._dio, this._snackbarService, this.userDataService);

  initialise() {
    getCategory();
  }

  void onSelectionChanged(int index) {
    selectedCategory = categoryResponse[index];
    notifyListeners();
  }

  void onDistanceChanged(value) {
    distance = value;
    notifyListeners();
  }

  getCategory() async {
    setBusy(true);
    try {
      var response = await _dio.get("/storecat/sendCategory");
      categoryResponse = response.data
          .map<CategoryModel>((item) => CategoryModel.fromJson(item))
          .toList();
      selectedCategory = categoryResponse[0];
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
}
