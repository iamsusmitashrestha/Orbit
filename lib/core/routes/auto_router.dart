import 'package:auto_route/auto_route.dart';
import 'package:orbit/features/categories/views/category_view.dart';
import 'package:orbit/features/home/views/home_view.dart';
import 'package:orbit/features/profile_setup/views/profile_setup_view.dart';
import 'package:orbit/features/role/views/role_selection_view.dart';
import 'package:orbit/features/signin/views/signin_view.dart';
import 'package:orbit/features/signup/views/signup_view.dart';

@MaterialAutoRouter(
  routes: [
    // MaterialRoute(
    //   page: SplashView,
    //   initial: true,
    // ),
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
      page: SignupView,
    ),
    MaterialRoute(
      page: ProfileSetupView,
    ),
    MaterialRoute(
      page: CategoryView,
      initial: true,
    ),
  ],
  usesLegacyGenerator: true,
)
class $AutoRouter {}
