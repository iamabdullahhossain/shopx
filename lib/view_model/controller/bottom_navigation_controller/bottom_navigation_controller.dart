import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/view/cart_screen/cart_screen.dart';
import 'package:shopx/view/favourite_screen/favourites_screen.dart';
import 'package:shopx/view/home_screen/widgets/home_screen_view.dart';
import 'package:shopx/view/settings_screen/settings_screen.dart';

class BottomNavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Widget> pages = [
    HomeScreenView(),
    FavouriteScreen(),
    CartScreen(),
    SettingsScreen()
  ];
}
