import 'package:auto_route/auto_route.dart';
import 'package:orbit/features/splash/splash_view.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(
      page: SplashView,
      initial: true,
    ),
  ],
  usesLegacyGenerator: true,
)
class $AutoRouter {}
