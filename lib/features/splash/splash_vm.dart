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
  final LocalStorageService _localStorageService;
  final NavigationService _navigationService;
  final UserDataService _userDataService;
  final Dio _dio;

  SplashViewModel(
    this._navigationService,
    this._dio,
    this._localStorageService,
    this._userDataService,
  );

  void initialise() {
    String token = _localStorageService.read('token') ?? "";
    if (token.length > 0) {
      getData();
    } else {
      Future.delayed(Duration(seconds: 2), () {
        _navigationService.replaceWith(Routes.roleSelectionViewRoute);
      });
    }
  }

  getData() async {
    setBusy(true);
    try {
      var response = await _dio.get("/store/myStore");
      bool hasStore = (response.data as List).length > 0;
      if (hasStore) {
        _userDataService.storeId = response.data[0]['_id'];
        _userDataService.userId = response.data[0]['owner'];
        _userDataService.storeName = response.data[0]['storeName'];
        _userDataService.contactNumber = response.data[0]['contactNumber'];
        _userDataService.address = response.data[0]['address'];
        _userDataService.location =
            latlngFromList(response.data[0]['location']);
        if (response.data[0]['logo'] != null) {
          _userDataService.logo =
              _dio.options.baseUrl + response.data[0]['logo'];
        }

        if (response.data[0]['description'] != null) {
          _userDataService.storeDescription = response.data[0]['description'];
        }
        if (response.data[0]['openingTime'] != null) {
          _userDataService.openingTime =
              timeFromString(response.data[0]['openingTime']);
        }
        if (response.data[0]['closingTime'] != null) {
          _userDataService.closingTime =
              timeFromString(response.data[0]['closingTime']);
        }
        if (response.data[0]['deliveryOption'] != null) {
          _userDataService.deliveryOption = response.data[0]['deliveryOption'];
        }
        if (response.data[0]['storeStatus'] != null) {
          _userDataService.storeStatus = response.data[0]['storeStatus'];
        }

        var categoryResponse =
            await _dio.get("/storecat/${response.data[0]['_id']}/getCategory");

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
    } on DioError catch (e) {
      setBusy(false);
    }
  }
}
