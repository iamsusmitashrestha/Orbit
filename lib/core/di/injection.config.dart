// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../../common/dio_error.dart' as _i16;
import '../../features/add_item/view_models/add_item_vm.dart' as _i3;
import '../../features/categories/view_models/category_vm.dart' as _i14;
import '../../features/home/home_vm.dart' as _i18;
import '../../features/profile_setup/sub_views/delete_item_bottom_sheet.dart'
    as _i5;
import '../../features/profile_setup/view_models/add_item_bottom_sheet_vm.dart'
    as _i13;
import '../../features/profile_setup/view_models/delete_item_view_model.dart'
    as _i15;
import '../../features/profile_setup/view_models/inventory_vm.dart' as _i19;
import '../../features/profile_setup/view_models/map_vm.dart' as _i20;
import '../../features/profile_setup/view_models/payment_methods_vm.dart'
    as _i21;
import '../../features/profile_setup/view_models/profile_setup_vm.dart' as _i22;
import '../../features/profile_setup/view_models/settings_vm.dart' as _i9;
import '../../features/profile_setup/view_models/store_details_vm.dart' as _i26;
import '../../features/profile_setup/view_models/store_profile_vm.dart' as _i27;
import '../../features/role/view_models/role_selection_vm.dart' as _i8;
import '../../features/signin/view_models/forget_password_vm.dart' as _i17;
import '../../features/signin/view_models/signin_vm.dart' as _i23;
import '../../features/signup/view_models/signup_vm.dart' as _i24;
import '../../features/signup/view_models/verify_code_vm.dart' as _i12;
import '../../features/splash/splash_vm.dart' as _i25;
import '../../features/upload_logo/upload_logo_vm.dart' as _i28;
import '../services/local_storage_service.dart' as _i7;
import '../services/toast_service.dart' as _i10;
import '../services/user_data_service.dart' as _i11;
import 'third_party_modules.dart'
    as _i29; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.factory<_i3.AddItemViewModel>(() => _i3.AddItemViewModel());
  gh.lazySingleton<_i4.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.factory<_i5.DeleteItemBottomSheetView>(
      () => _i5.DeleteItemBottomSheetView());
  gh.lazySingleton<_i4.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.factory<_i6.Dio>(() => thirdPartyServicesModule.dio);
  gh.factory<_i7.LocalStorageService>(() => _i7.LocalStorageService());
  gh.lazySingleton<_i4.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.factory<_i8.RoleSelectionViewModel>(
      () => _i8.RoleSelectionViewModel(get<_i4.NavigationService>()));
  gh.factory<_i9.SettingsViewModel>(() => _i9.SettingsViewModel());
  gh.lazySingleton<_i4.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  gh.lazySingleton<_i10.ToastService>(() => _i10.ToastService());
  gh.lazySingleton<_i11.UserDataService>(() => _i11.UserDataService());
  gh.factory<_i12.VerifyCodeViewModel>(() => _i12.VerifyCodeViewModel(
      get<_i6.Dio>(),
      get<_i4.NavigationService>(),
      get<_i4.SnackbarService>()));
  gh.factory<_i13.AddItemBottomSheetViewModel>(() =>
      _i13.AddItemBottomSheetViewModel(
          get<_i6.Dio>(),
          get<_i4.SnackbarService>(),
          get<_i4.NavigationService>(),
          get<_i11.UserDataService>()));
  gh.factory<_i14.CategoryViewModel>(() => _i14.CategoryViewModel(
      get<_i4.NavigationService>(),
      get<_i6.Dio>(),
      get<_i4.SnackbarService>(),
      get<_i11.UserDataService>()));
  gh.factory<_i15.DeleteItemBottomSheetViewModel>(
      () => _i15.DeleteItemBottomSheetViewModel(get<_i4.NavigationService>()));
  gh.lazySingleton<_i16.DioErrorService>(
      () => _i16.DioErrorService(get<_i6.Dio>(), get<_i4.SnackbarService>()));
  gh.factory<_i17.ForgetPasswordViewModel>(() => _i17.ForgetPasswordViewModel(
      navigationService: get<_i4.NavigationService>(),
      snackbarService: get<_i4.SnackbarService>(),
      dio: get<_i6.Dio>(),
      localStorageService: get<_i7.LocalStorageService>()));
  gh.factory<_i18.HomeViewModel>(() => _i18.HomeViewModel(
      get<_i6.Dio>(), get<_i4.SnackbarService>(), get<_i11.UserDataService>()));
  gh.factory<_i19.InventoryViewModel>(() => _i19.InventoryViewModel(
      get<_i4.NavigationService>(),
      get<_i6.Dio>(),
      get<_i11.UserDataService>(),
      get<_i4.SnackbarService>()));
  gh.factory<_i20.MapViewModel>(
      () => _i20.MapViewModel(get<_i4.NavigationService>()));
  gh.factory<_i21.PaymentMethodViewModel>(() => _i21.PaymentMethodViewModel(
      get<_i11.UserDataService>(), get<_i4.SnackbarService>(), get<_i6.Dio>()));
  gh.factory<_i22.ProfileSetupViewModel>(() => _i22.ProfileSetupViewModel(
      get<_i4.NavigationService>(),
      get<_i4.SnackbarService>(),
      get<_i6.Dio>(),
      get<_i7.LocalStorageService>()));
  gh.factory<_i23.SigninViewModel>(() => _i23.SigninViewModel(
      navigationService: get<_i4.NavigationService>(),
      snackbarService: get<_i4.SnackbarService>(),
      dio: get<_i6.Dio>(),
      localStorageService: get<_i7.LocalStorageService>()));
  gh.factory<_i24.SignupViewModel>(() => _i24.SignupViewModel(
      get<_i4.NavigationService>(),
      get<_i4.SnackbarService>(),
      get<_i6.Dio>()));
  gh.factory<_i25.SplashViewModel>(() => _i25.SplashViewModel(
      get<_i4.NavigationService>(),
      get<_i6.Dio>(),
      get<_i7.LocalStorageService>(),
      get<_i11.UserDataService>()));
  gh.factory<_i26.StoreDetailsViewModel>(() => _i26.StoreDetailsViewModel(
      get<_i11.UserDataService>(),
      get<_i4.NavigationService>(),
      get<_i4.SnackbarService>(),
      get<_i6.Dio>()));
  gh.factory<_i27.StoreProfileViewModel>(() => _i27.StoreProfileViewModel(
      get<_i4.NavigationService>(),
      get<_i11.UserDataService>(),
      get<_i6.Dio>(),
      get<_i7.LocalStorageService>()));
  gh.factory<_i28.UploadLogoViewModel>(() => _i28.UploadLogoViewModel(
      get<_i4.NavigationService>(),
      get<_i6.Dio>(),
      get<_i11.UserDataService>(),
      get<_i4.SnackbarService>()));
  return get;
}

class _$ThirdPartyServicesModule extends _i29.ThirdPartyServicesModule {
  @override
  _i4.BottomSheetService get bottomSheetService => _i4.BottomSheetService();
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i4.SnackbarService get snackBarService => _i4.SnackbarService();
}
