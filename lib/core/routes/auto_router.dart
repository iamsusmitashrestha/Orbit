import 'package:auto_route/auto_route.dart';
import 'package:orbit/features/cart/views/cart_view.dart';
import 'package:orbit/features/categories/views/category_view.dart';
import 'package:orbit/features/home/views/home_view.dart';
import 'package:orbit/features/order/views/order_view.dart';
import 'package:orbit/features/order/views/store_order_view.dart';
import 'package:orbit/features/profile/views/profile_view.dart';
import 'package:orbit/features/profile/views/searched_profile_view.dart';
import 'package:orbit/features/profile_setup/views/add_item_view.dart';
import 'package:orbit/features/profile_setup/views/inventory_view.dart';
import 'package:orbit/features/profile_setup/views/map_view.dart';
import 'package:orbit/features/profile_setup/views/profile_setup_view.dart';
import 'package:orbit/features/profile_setup/views/store_profile_view.dart';
import 'package:orbit/features/profile_setup/views/store_details_view.dart';
import 'package:orbit/features/profile_setup/views/payment_method_view.dart';
import 'package:orbit/features/profile_setup/views/settings_view.dart';
import 'package:orbit/features/role/views/role_selection_view.dart';
import 'package:orbit/features/signin/views/forget_password_view.dart';
import 'package:orbit/features/signin/views/signin_view.dart';
import 'package:orbit/features/signup/views/signup_view.dart';
import 'package:orbit/features/signup/views/verify_code_view.dart';
import 'package:orbit/features/splash/splash_view.dart';
import 'package:orbit/features/upload_logo/upload_logo_view.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(
      page: SplashView,
      initial: true,
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
    ),
    MaterialRoute(
      page: VerifyCodeView,
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
    MaterialRoute(
      page: InventoryView,
    ),
    MaterialRoute(
      page: AddItemView,
    ),
    MaterialRoute(
      page: StoreDetailsView,
    ),
    MaterialRoute(
      page: PaymentMethodView,
    ),
    MaterialRoute(
      page: SettingsView,
    ),
    MaterialRoute(
      page: ProfileView,
    ),
    MaterialRoute(
      page: SearchedProfileView,
    ),
    MaterialRoute(
      page: CartView,
    ),
    MaterialRoute(
      page: OrderView,
    ),
    MaterialRoute(
      page: StoreOrderView,
    ),
  ],
  usesLegacyGenerator: true,
)
class $AutoRouter {}
