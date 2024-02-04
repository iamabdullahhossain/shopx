import 'package:get/get.dart';
import 'package:shopx/res/routes/routes_name.dart';
import 'package:shopx/view/cart_screen/cart_screen.dart';
import 'package:shopx/view/home_screen/home_screen.dart';
import 'package:shopx/view/login_screen/login_screen.dart';
import 'package:shopx/view/splash_screen/splash_screen.dart';

import '../../view/favourite_screen/favourites_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen, page: () => const SplashScreen()),
        GetPage(
            name: RoutesName.homeScreen,
            page: () => const HomeScreen(),
            transition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 75)),
        GetPage(
            name: RoutesName.loginScreen,
            page: () => const LoginScreen(),
            transition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 75)),
        GetPage(
            name: RoutesName.cartScreen,
            page: () => const CartScreen(),
            transition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 75)),
        GetPage(
            name: RoutesName.favouriteScreen,
            page: () => const FavouriteScreen(),
            transition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 75))
      ];
}
