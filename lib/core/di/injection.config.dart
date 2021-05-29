// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../../features/categories/view_models/category_vm.dart' as _i15;
import '../../features/profile_setup/view_models/add_item_bottom_sheet_vm.dart'
    as _i3;
import '../../features/profile_setup/view_models/inventory_vm.dart' as _i6;
import '../../features/profile_setup/view_models/map_vm.dart' as _i17;
import '../../features/profile_setup/view_models/payment_methods_vm.dart'
    as _i8;
import '../../features/profile_setup/view_models/profile_setup_vm.dart' as _i18;
import '../../features/profile_setup/view_models/settings_vm.dart' as _i10;
import '../../features/profile_setup/view_models/store_details_vm.dart' as _i11;
import '../../features/profile_setup/view_models/store_profile_vm.dart' as _i22;
import '../../features/role/view_models/role_selection_vm.dart' as _i9;
import '../../features/signin/view_models/forget_password_vm.dart' as _i16;
import '../../features/signin/view_models/signin_vm.dart' as _i19;
import '../../features/signup/view_models/signup_vm.dart' as _i20;
import '../../features/signup/view_models/verify_code_vm.dart' as _i14;
import '../../features/splash/splash_vm.dart' as _i21;
import '../../features/upload_logo/upload_logo_vm.dart' as _i23;
import '../services/local_storage_service.dart' as _i7;
import '../services/toast_service.dart' as _i12;
import '../services/user_data_service.dart' as _i13;
import 'third_party_modules.dart'
    as _i24; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.factory<_i3.AddItemBottomSheetViewModel>(
      () => _i3.AddItemBottomSheetViewModel());
  gh.lazySingleton<_i4.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<_i4.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.factory<_i5.Dio>(() => thirdPartyServicesModule.dio);
  gh.factory<_i6.InventoryViewModel>(() => _i6.InventoryViewModel());
  gh.factory<_i7.LocalStorageService>(() => _i7.LocalStorageService());
  gh.lazySingleton<_i4.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.factory<_i8.PaymentMethodViewModel>(() => _i8.PaymentMethodViewModel());
  gh.factory<_i9.RoleSelectionViewModel>(
      () => _i9.RoleSelectionViewModel(get<_i4.NavigationService>()));
  gh.factory<_i10.SettingsViewModel>(() => _i10.SettingsViewModel());
  gh.lazySingleton<_i4.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  gh.factory<_i11.StoreDetailsViewModel>(() => _i11.StoreDetailsViewModel());
  gh.lazySingleton<_i12.ToastService>(() => _i12.ToastService());
  gh.lazySingleton<_i13.UserDataService>(() => _i13.UserDataService());
  gh.factory<_i14.VerifyCodeViewModel>(() => _i14.VerifyCodeViewModel(
      get<_i5.Dio>(),
      get<_i4.NavigationService>(),
      get<_i4.SnackbarService>()));
  gh.factory<_i15.CategoryViewModel>(() => _i15.CategoryViewModel(
      get<_i4.NavigationService>(),
      get<_i5.Dio>(),
      get<_i4.SnackbarService>(),
      get<_i13.UserDataService>()));
  gh.factory<_i16.ForgetPasswordViewModel>(() => _i16.ForgetPasswordViewModel(
      navigationService: get<_i4.NavigationService>(),
      snackbarService: get<_i4.SnackbarService>(),
      dio: get<_i5.Dio>(),
      localStorageService: get<_i7.LocalStorageService>()));
  gh.factory<_i17.MapViewModel>(
      () => _i17.MapViewModel(get<_i4.NavigationService>()));
  gh.factory<_i18.ProfileSetupViewModel>(() => _i18.ProfileSetupViewModel(
      get<_i4.NavigationService>(),
      get<_i4.SnackbarService>(),
      get<_i5.Dio>(),
      get<_i7.LocalStorageService>()));
  gh.factory<_i19.SigninViewModel>(() => _i19.SigninViewModel(
      navigationService: get<_i4.NavigationService>(),
      snackbarService: get<_i4.SnackbarService>(),
      dio: get<_i5.Dio>(),
      localStorageService: get<_i7.LocalStorageService>()));
  gh.factory<_i20.SignupViewModel>(() => _i20.SignupViewModel(
      get<_i4.NavigationService>(),
      get<_i4.SnackbarService>(),
      get<_i5.Dio>()));
  gh.factory<_i21.SplashViewModel>(() => _i21.SplashViewModel(
      get<_i4.NavigationService>(),
      get<_i5.Dio>(),
      get<_i7.LocalStorageService>(),
      get<_i13.UserDataService>()));
  gh.factory<_i22.StoreProfileViewModel>(() => _i22.StoreProfileViewModel(
      get<_i4.NavigationService>(), get<_i13.UserDataService>()));
  gh.factory<_i23.UploadLogoViewModel>(() => _i23.UploadLogoViewModel(
      get<_i4.NavigationService>(),
      get<_i5.Dio>(),
      get<_i13.UserDataService>(),
      get<_i4.SnackbarService>()));
  return get;
}

class _$ThirdPartyServicesModule extends _i24.ThirdPartyServicesModule {
  @override
  _i4.BottomSheetService get bottomSheetService => _i4.BottomSheetService();
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i4.SnackbarService get snackBarService => _i4.SnackbarService();
}
