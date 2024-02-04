import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/view_model/controller/home_screen_controller/home_screen_controller.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Fav"),
      ),
    );
  }
}
