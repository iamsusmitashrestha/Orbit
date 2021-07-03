import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/categories/models/category.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class ProfileViewModel extends BaseViewModel {
  List<CategoryModel> categoryResponse = [];
  CategoryModel? selectedCategory;
  num? distance;

  final Dio _dio;
  final UserDataService userDataService;
  final SnackbarService _snackbarService;
  final NavigationService _navigationService;
  ProfileViewModel(this._dio, this._snackbarService, this.userDataService,
      this._navigationService);

  initialise() {}

  goBack() {
    _navigationService.back();
  }
}
