import 'package:auto_route/auto_route.dart';
import 'package:orbit/features/home/views/home_view.dart';
import 'package:orbit/features/signup/views/role_selection_view.dart';
import 'package:orbit/features/splash/splash_view.dart';

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
      initial: true,
    ),
  ],
  usesLegacyGenerator: true,
)
class $AutoRouter {}
