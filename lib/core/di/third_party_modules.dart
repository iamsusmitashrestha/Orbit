import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'injection.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackBarService;
  @lazySingleton
  BottomSheetService get bottomSheetService;

  @injectable
  Dio get dio {
    Dio dioInstance = new Dio();
    dioInstance.options.baseUrl = "https://orbit1.herokuapp.com";
    String token = locator<LocalStorageService>().read('token') ?? "";
    dioInstance.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers["x-auth-token"] = token;
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      return handler.next(e); //continue
    }));

    return dioInstance;
  }
}
