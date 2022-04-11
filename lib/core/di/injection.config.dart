// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i3;

import '../../features/cart/view_models/cart_vm.dart' as _i13;
import '../../features/categories/view_models/category_vm.dart' as _i14;
import '../../features/home/view_models/home_vm.dart' as _i17;
import '../../features/order/view_models/order_vm.dart' as _i20;
import '../../features/order/view_models/store_order_vm.dart' as _i29;
import '../../features/profile/view_models/profile_vm.dart' as _i23;
import '../../features/profile/view_models/searched_profile_vm.dart' as _i24;
import '../../features/profile_setup/sub_views/delete_item_bottom_sheet.dart'
    as _i4;
import '../../features/profile_setup/view_models/add_item_vm.dart' as _i12;
import '../../features/profile_setup/view_models/delete_item_view_model.dart'
    as _i15;
import '../../features/profile_setup/view_models/inventory_vm.dart' as _i18;
import '../../features/profile_setup/view_models/map_vm.dart' as _i19;
import '../../features/profile_setup/view_models/payment_methods_vm.dart'
    as _i21;
import '../../features/profile_setup/view_models/profile_setup_vm.dart' as _i22;
import '../../features/profile_setup/view_models/settings_vm.dart' as _i8;
import '../../features/profile_setup/view_models/store_details_vm.dart' as _i28;
import '../../features/profile_setup/view_models/store_profile_vm.dart' as _i30;
import '../../features/role/view_models/role_selection_vm.dart' as _i7;
import '../../features/signin/view_models/forget_password_vm.dart' as _i16;
import '../../features/signin/view_models/signin_vm.dart' as _i25;
import '../../features/signup/view_models/signup_vm.dart' as _i26;
import '../../features/signup/view_models/verify_code_vm.dart' as _i11;
import '../../features/splash/splash_vm.dart' as _i27;
import '../../features/upload_logo/upload_logo_vm.dart' as _i31;
import '../services/local_storage_service.dart' as _i6;
import '../services/toast_service.dart' as _i9;
import '../services/user_data_service.dart' as _i10;
import 'third_party_modules.dart'
    as _i32; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.factory<_i4.DeleteItemBottomSheetView>(
      () => _i4.DeleteItemBottomSheetView());
  gh.lazySingleton<_i3.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.factory<_i5.Dio>(() => thirdPartyServicesModule.dio);
  gh.factory<_i6.LocalStorageService>(() => _i6.LocalStorageService());
  gh.lazySingleton<_i3.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.factory<_i7.RoleSelectionViewModel>(() => _i7.RoleSelectionViewModel(
      get<_i3.NavigationService>(), get<_i6.LocalStorageService>()));
  gh.factory<_i8.SettingsViewModel>(() => _i8.SettingsViewModel());
  gh.lazySingleton<_i3.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  gh.lazySingleton<_i9.ToastService>(() => _i9.ToastService());
  gh.lazySingleton<_i10.UserDataService>(() => _i10.UserDataService());
  gh.factory<_i11.VerifyCodeViewModel>(() => _i11.VerifyCodeViewModel(
      get<_i5.Dio>(),
      get<_i3.NavigationService>(),
      get<_i3.SnackbarService>(),
      get<_i6.LocalStorageService>()));
  gh.factory<_i12.AddItemViewModel>(() => _i12.AddItemViewModel(
      get<_i5.Dio>(),
      get<_i3.SnackbarService>(),
      get<_i3.NavigationService>(),
      get<_i10.UserDataService>()));
  gh.factory<_i13.CartViewModel>(() => _i13.CartViewModel(
      get<_i3.SnackbarService>(),
      get<_i5.Dio>(),
      get<_i3.NavigationService>()));
  gh.factory<_i14.CategoryViewModel>(() => _i14.CategoryViewModel(
      get<_i3.NavigationService>(),
      get<_i5.Dio>(),
      get<_i3.SnackbarService>(),
      get<_i10.UserDataService>(),
      get<_i6.LocalStorageService>()));
  gh.factory<_i15.DeleteItemBottomSheetViewModel>(
      () => _i15.DeleteItemBottomSheetViewModel(get<_i3.NavigationService>()));
  gh.factory<_i16.ForgetPasswordViewModel>(() => _i16.ForgetPasswordViewModel(
      navigationService: get<_i3.NavigationService>(),
      snackbarService: get<_i3.SnackbarService>(),
      dio: get<_i5.Dio>(),
      localStorageService: get<_i6.LocalStorageService>()));
  gh.factory<_i17.HomeViewModel>(() => _i17.HomeViewModel(
      get<_i5.Dio>(),
      get<_i3.SnackbarService>(),
      get<_i10.UserDataService>(),
      get<_i3.NavigationService>(),
      get<_i6.LocalStorageService>()));
  gh.factory<_i18.InventoryViewModel>(() => _i18.InventoryViewModel(
      get<_i3.NavigationService>(),
      get<_i5.Dio>(),
      get<_i10.UserDataService>(),
      get<_i3.SnackbarService>()));
  gh.factory<_i19.MapViewModel>(
      () => _i19.MapViewModel(get<_i3.NavigationService>()));
  gh.factory<_i20.OrderViewModel>(() => _i20.OrderViewModel(
      get<_i3.NavigationService>(),
      get<_i5.Dio>(),
      get<_i3.SnackbarService>(),
      get<_i10.UserDataService>(),
      get<_i6.LocalStorageService>()));
  gh.factory<_i21.PaymentMethodViewModel>(() => _i21.PaymentMethodViewModel(
      get<_i10.UserDataService>(), get<_i3.SnackbarService>(), get<_i5.Dio>()));
  gh.factory<_i22.ProfileSetupViewModel>(() => _i22.ProfileSetupViewModel(
      get<_i3.NavigationService>(),
      get<_i3.SnackbarService>(),
      get<_i5.Dio>(),
      get<_i6.LocalStorageService>()));
  gh.factory<_i23.ProfileViewModel>(() => _i23.ProfileViewModel(
      get<_i5.Dio>(),
      get<_i3.SnackbarService>(),
      get<_i10.UserDataService>(),
      get<_i3.NavigationService>()));
  gh.factory<_i24.SearchedProfileViewModel>(() => _i24.SearchedProfileViewModel(
      get<_i5.Dio>(),
      get<_i3.SnackbarService>(),
      get<_i10.UserDataService>(),
      get<_i3.NavigationService>()));
  gh.factory<_i25.SigninViewModel>(() => _i25.SigninViewModel(
      navigationService: get<_i3.NavigationService>(),
      snackbarService: get<_i3.SnackbarService>(),
      dio: get<_i5.Dio>(),
      localStorageService: get<_i6.LocalStorageService>()));
  gh.factory<_i26.SignupViewModel>(() => _i26.SignupViewModel(
      get<_i3.NavigationService>(),
      get<_i3.SnackbarService>(),
      get<_i5.Dio>(),
      get<_i6.LocalStorageService>()));
  gh.factory<_i27.SplashViewModel>(() => _i27.SplashViewModel(
      get<_i3.NavigationService>(),
      get<_i5.Dio>(),
      get<_i6.LocalStorageService>(),
      get<_i10.UserDataService>(),
      get<_i3.SnackbarService>()));
  gh.factory<_i28.StoreDetailsViewModel>(() => _i28.StoreDetailsViewModel(
      get<_i10.UserDataService>(),
      get<_i3.NavigationService>(),
      get<_i3.SnackbarService>(),
      get<_i5.Dio>()));
  gh.factory<_i29.StoreOrderViewModel>(() => _i29.StoreOrderViewModel(
      get<_i3.NavigationService>(),
      get<_i5.Dio>(),
      get<_i3.SnackbarService>(),
      get<_i10.UserDataService>(),
      get<_i6.LocalStorageService>()));
  gh.factory<_i30.StoreProfileViewModel>(() => _i30.StoreProfileViewModel(
      get<_i3.NavigationService>(),
      get<_i10.UserDataService>(),
      get<_i5.Dio>(),
      get<_i6.LocalStorageService>(),
      get<_i3.SnackbarService>()));
  gh.factory<_i31.UploadLogoViewModel>(() => _i31.UploadLogoViewModel(
      get<_i3.NavigationService>(),
      get<_i5.Dio>(),
      get<_i10.UserDataService>(),
      get<_i3.SnackbarService>()));
  return get;
}

class _$ThirdPartyServicesModule extends _i32.ThirdPartyServicesModule {
  @override
  _i3.BottomSheetService get bottomSheetService => _i3.BottomSheetService();
  @override
  _i3.DialogService get dialogService => _i3.DialogService();
  @override
  _i3.NavigationService get navigationService => _i3.NavigationService();
  @override
  _i3.SnackbarService get snackBarService => _i3.SnackbarService();
}
