import 'package:auto_route/auto_route.dart';
import 'package:orbit/features/categories/views/category_view.dart';
import 'package:orbit/features/home/views/home_view.dart';
import 'package:orbit/features/profile_setup/views/map_view.dart';
import 'package:orbit/features/profile_setup/views/profile_setup_view.dart';
import 'package:orbit/features/profile_setup/views/store_profile_view.dart';
import 'package:orbit/features/role/views/role_selection_view.dart';
import 'package:orbit/features/signin/views/forget_password_view.dart';
import 'package:orbit/features/signin/views/signin_view.dart';
import 'package:orbit/features/signup/views/signup_view.dart';
import 'package:orbit/features/splash/splash_view.dart';
import 'package:orbit/features/upload_logo/upload_logo_view.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(
      page: SplashView,
    ),
    MaterialRoute(
      page: HomeView,
    ),
    MaterialRoute(
      page: RoleSelectionView,
    ),
    MaterialRoute(
      page: SigninView,
    ),
    MaterialRoute(
      page: ForgetPasswordView,
    ),
    MaterialRoute(
      page: SignupView,
      initial: true,
    ),
    MaterialRoute(
      page: ProfileSetupView,
    ),
    MaterialRoute(
      page: MapView,
    ),
    MaterialRoute(
      page: CategoryView,
    ),
    MaterialRoute(
      page: UploadLogoView,
    ),
    MaterialRoute(
      page: StoreProfileView,
    ),
  ],
  usesLegacyGenerator: true,
)
class $AutoRouter {}
