import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

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
    return dioInstance;
  }
}
