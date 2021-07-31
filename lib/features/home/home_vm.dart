import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/categories/models/category.dart';
import 'package:orbit/features/home/model/searched_store.dart';
import 'package:orbit/features/home/model/store.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  List<CategoryModel> categoryResponse = [];
  List<StoreModel> storeResponse = [];
  CategoryModel? selectedCategory;
  List<SearchedStoreModel> searchedStoreResponse = [];
  num distance = 0;
  String? searchTitle;
  LocationData? locData;

  final Dio _dio;
  final UserDataService userDataService;
  final SnackbarService _snackbarService;
  final NavigationService _navigationService;
  HomeViewModel(this._dio, this._snackbarService, this.userDataService,
      this._navigationService);

  initialise() {
    getCategory();
    getCurrentUserLocation();
  }

  void onSelectionChanged(value) {
    selectedCategory = value;
    notifyListeners();
  }

  void onDistanceChanged(String value) {
    distance = num.parse(value);
    notifyListeners();
  }

  void onSearchChanged(value) {
    searchTitle = value;
    notifyListeners();
  }

  Future<void> getCurrentUserLocation() async {
    setBusy(true);
    clearErrors();
    try {
      locData = await Location().getLocation();
    } catch (e) {
      setError("Unable to get Location");
    }
    setBusy(false);
  }

  LocationData get currentLocation => locData!;

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

  search() async {
    setBusy(true);
    try {
      var response = await _dio.get("/store/search?title=$searchTitle");
      searchedStoreResponse = response.data
          .map<SearchedStoreModel>((item) => SearchedStoreModel.fromJson(item))
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

  getStoreByDistance() async {
    setBusy(true);

    try {
      var response = await _dio.post("/store/distance", data: {
        'currentLocation': [
          currentLocation.longitude,
          currentLocation.latitude
        ],
        'distancewithin': distance,
        'categoryGiven': selectedCategory?.value,
      });

      storeResponse = response.data
          .map<StoreModel>((item) => StoreModel.fromJson(item))
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

  goToProfileView() {
    _navigationService.navigateTo(Routes.profileViewRoute);
  }
}
