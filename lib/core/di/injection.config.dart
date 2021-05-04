// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i3;

import '../../features/categories/view_models/category_vm.dart' as _i10;
import '../../features/profile_setup/view_models/profile_setup_vm.dart' as _i6;
import '../../features/role/view_models/role_selection_vm.dart' as _i7;
import '../../features/signin/view_models/signin_vm.dart' as _i11;
import '../../features/signup/view_models/signup_vm.dart' as _i12;
import '../../features/upload_logo/upload_logo_vm.dart' as _i9;
import '../services/local_storage_service.dart' as _i5;
import '../services/toast_service.dart' as _i8;
import 'third_party_modules.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<_i3.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.factory<_i4.Dio>(() => thirdPartyServicesModule.dio);
  gh.factory<_i5.LocalStorageService>(() => _i5.LocalStorageService());
  gh.lazySingleton<_i3.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.factory<_i6.ProfileSetupViewModel>(
      () => _i6.ProfileSetupViewModel(get<_i3.NavigationService>()));
  gh.factory<_i7.RoleSelectionViewModel>(
      () => _i7.RoleSelectionViewModel(get<_i3.NavigationService>()));
  gh.lazySingleton<_i3.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  gh.lazySingleton<_i8.ToastService>(() => _i8.ToastService());
  gh.factory<_i9.UploadLogoViewModel>(() => _i9.UploadLogoViewModel());
  gh.factory<_i10.CategoryViewModel>(
      () => _i10.CategoryViewModel(get<_i3.NavigationService>()));
  gh.factory<_i11.SigninViewModel>(() => _i11.SigninViewModel(
      navigationService: get<_i3.NavigationService>(),
      snackbarService: get<_i3.SnackbarService>(),
      dio: get<_i4.Dio>(),
      localStorageService: get<_i5.LocalStorageService>()));
  gh.factory<_i12.SignupViewModel>(() => _i12.SignupViewModel(
      get<_i3.NavigationService>(),
      get<_i3.SnackbarService>(),
      get<_i4.Dio>()));
  return get;
}

class _$ThirdPartyServicesModule extends _i13.ThirdPartyServicesModule {
  @override
  _i3.BottomSheetService get bottomSheetService => _i3.BottomSheetService();
  @override
  _i3.DialogService get dialogService => _i3.DialogService();
  @override
  _i3.NavigationService get navigationService => _i3.NavigationService();
  @override
  _i3.SnackbarService get snackBarService => _i3.SnackbarService();
}
