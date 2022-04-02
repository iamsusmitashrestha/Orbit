import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/categories/models/category.dart';
import 'package:orbit/features/home/model/searched_store.dart';
import 'package:orbit/features/profile_setup/models/items.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class SearchedProfileViewModel extends BaseViewModel {
  List<CategoryModel> categoryResponse = [];
  CategoryModel? selectedCategory;
  num? distance;
  int currentIndex = 0;
  List<ItemModel> items = [];
  int carouselIndex = 0;
  String? searchTitle;
  List<ItemModel> searchedProductResponse = [];

  late SearchedStoreModel store;
  PageController btmNavigationPageController = PageController(initialPage: 0);

  final Dio _dio;
  final UserDataService userDataService;
  final SnackbarService _snackbarService;
  final NavigationService _navigationService;

  SearchedProfileViewModel(this._dio, this._snackbarService,
      this.userDataService, this._navigationService);

  initialise(SearchedStoreModel store) {
    this.store = store;
    getProducts();
  }

  void onSearchChanged(value) {
    searchTitle = value;
    notifyListeners();
  }

  setTabIndex(int index) {
    currentIndex = index;
    btmNavigationPageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

  setCarouselIndex(index) {
    carouselIndex = index;
    notifyListeners();
  }

  addToCart(ItemModel item) async {
    setBusyForObject(item, true);

    try {
      var response = await _dio.post("/cart/addItemToCart/${item.id}");
      _snackbarService.showSnackbar(message: response.data['message']);
    } on DioError catch (e) {
      setError("Something went wrong !");
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response!.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusyForObject(item, false);
  }

  getProducts() async {
    setBusyForObject(items, true);
    try {
      clearErrors();
      print(store.storedetails?.sId);

      var response = await _dio
          .get("/store/${store.storedetails?.sId}/getProductwithoutauth");
      items = response.data
          .map<ItemModel>(
              (item) => ItemModel.fromJson(item, _dio.options.baseUrl))
          .toList();
    } on DioError catch (e) {
      setError("Something went wrong !");
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response!.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusyForObject(items, false);
  }

  search() async {
    setBusyForObject(searchedProductResponse, true);
    try {
      var response = await _dio
          .get("/search/${store.storedetails!.sId}?title=$searchTitle");
      searchedProductResponse = response.data
          .map<ItemModel>(
              (item) => ItemModel.fromJson(item, _dio.options.baseUrl))
          .toList();
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        print(e.response?.data);
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusyForObject(searchedProductResponse, false);
  }

  goBack() {
    _navigationService.back();
  }
}
