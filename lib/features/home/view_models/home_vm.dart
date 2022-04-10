import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/categories/models/category.dart';
import 'package:orbit/features/home/model/searched_store.dart';
import 'package:orbit/features/home/model/store.dart';
import 'package:orbit/features/profile_setup/models/items.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  List<CategoryModel> categoryResponse = [];
  List<StoreModel> storeResponse = [];
  CategoryModel? selectedCategory;
  List<SearchedStoreModel> searchedStoreResponse = [];
  List<ItemModel> cart = [];

  num distance = 0;
  String? searchTitle;
  LocationData? locData;

  final Dio _dio;
  final UserDataService userDataService;
  final SnackbarService _snackbarService;
  final LocalStorageService localStorageService;
  final NavigationService _navigationService;
  HomeViewModel(this._dio, this._snackbarService, this.userDataService,
      this._navigationService, this.localStorageService);

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
    clearErrors();
    try {
      setBusy(true);

      locData = await Location().getLocation();
    } catch (e) {
      setError("Unable to get Location");
    }
    setBusy(false);
  }

  LocationData get currentLocation => locData!;

  getCategory() async {
    setBusyForObject(categoryResponse, true);
    try {
      var response = await _dio.get("/storecat/sendCategory");
      categoryResponse = response.data
          .map<CategoryModel>((item) => CategoryModel.fromJson(item))
          .toList();
      selectedCategory = categoryResponse[0];
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusyForObject(categoryResponse, false);
  }

  search() async {
    storeResponse = [];
    setBusyForObject(searchedStoreResponse, true);
    try {
      var response = await _dio.get("/store/search?title=$searchTitle");
      searchedStoreResponse = response.data
          .map<SearchedStoreModel>((item) => SearchedStoreModel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusyForObject(searchedStoreResponse, false);
  }

  getStoreByDistance() async {
    searchedStoreResponse = [];
    setBusyForObject(storeResponse, true);

    try {
      var response = await _dio.post("/store/distance", data: {
        'currentLocation': [
          currentLocation.longitude,
          currentLocation.latitude
        ],
        'distancewithin': distance * 1000,
        'categoryGiven': selectedCategory?.value,
      });
      print(selectedCategory?.value);
      print(distance);
      print(currentLocation.longitude);
      print(currentLocation.latitude);
      print(response.data);

      storeResponse = response.data
          .map<StoreModel>((item) => StoreModel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusyForObject(storeResponse, false);
  }

  goToProfileView(StoreModel store) {
    _navigationService.navigateTo(Routes.profileViewRoute, arguments: store);
  }

  goToCartView() {
    _navigationService.navigateTo(Routes.cartViewRoute);
  }

  goToOrderView() {
    _navigationService.navigateTo(Routes.orderViewRoute);
  }

  goToSearchedProfileView(SearchedStoreModel store) {
    _navigationService.navigateTo(Routes.searchedProfileViewRoute,
        arguments: store);
  }

  logOut() {
    localStorageService.clear('token');
    _navigationService.clearStackAndShow(Routes.splashViewRoute);
  }
}
