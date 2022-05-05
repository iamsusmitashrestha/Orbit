import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/common/utils/latlng_from_list.dart';
import 'package:orbit/common/utils/time_from_string.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class SplashViewModel extends BaseViewModel {
  String role = "";
  final LocalStorageService _localStorageService;
  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final UserDataService _userDataService;
  final Dio _dio;

  SplashViewModel(
    this._navigationService,
    this._dio,
    this._localStorageService,
    this._userDataService,
    this._snackbarService,
  );

  void initialise() {
    role = _localStorageService.read("role") ?? "";
    String token = _localStorageService.read('token') ?? "";
    if (token.length > 0) {
      role == "vendor"
          ? getData()
          : Future.delayed(Duration(seconds: 2), () {
              _navigationService.replaceWith(Routes.homeViewRoute);
            });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        _navigationService.replaceWith(Routes.roleSelectionViewRoute);
      });
    }
  }

  getData() async {
    setBusy(true);
    try {
      // print(_localStorageService.read("token"));
      var response = await _dio.get("/store/myStore");
      if (response.data.containsKey("store")) {
        _userDataService.storeId = response.data['store']['_id'];
        print(_userDataService.storeId);
        _userDataService.userId = response.data['store']['owner'];
        _userDataService.storeName = response.data['store']['storeName'];
        _userDataService.phoneNumber = response.data['phoneNumber'];
        _userDataService.address = response.data['store']['address'];
        _userDataService.location =
            latlngFromList(response.data['store']['location']);
        if (response.data['store']['logo'] != null) {
          _userDataService.logo =
              _dio.options.baseUrl + response.data['store']['logo'];
        }

        if (response.data['store']['description'] != null) {
          _userDataService.storeDescription =
              response.data['store']['description'];
        }
        if (response.data['store']['openingTime'] != null) {
          _userDataService.openingTime =
              timeFromString(response.data['store']['openingTime']);
        }
        if (response.data['store']['closingTime'] != null) {
          _userDataService.closingTime =
              timeFromString(response.data['store']['closingTime']);
        }
        if (response.data['store']['deliveryOption'] != null) {
          _userDataService.deliveryOption =
              response.data['store']['deliveryOption'];
        }
        if (response.data['store']['storeStatus'] != null) {
          _userDataService.storeStatus = response.data['store']['storeStatus'];
        }
        if (response.data['store']['paymentMethod'] != null) {
          _userDataService.paymentMethod =
              List<String>.from(response.data['store']['paymentMethod']);
        }

        var categoryResponse = await _dio
            .get("/storecat/${response.data['store']['_id']}/getCategory");

        if (categoryResponse.data.length > 0) {
          _userDataService.categories =
              List<String>.from(categoryResponse.data[0]['category']);

          if (_userDataService.logo == null) {
            _navigationService.replaceWith(Routes.uploadLogoViewRoute);
          } else {
            _navigationService.replaceWith(Routes.storeProfileViewRoute);
          }
        } else {
          _navigationService.replaceWith(Routes.categoryViewRoute);
        }
      } else {
        _navigationService.replaceWith(Routes.profileSetupViewRoute);
      }
      // _snackbarService.showSnackbar(
      //   message: response.data['message'],
      //   duration: Duration(seconds: 1),
      // );
      setBusy(false);
    } on DioError catch (e) {
      setBusy(false);
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response!.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
  }
}
