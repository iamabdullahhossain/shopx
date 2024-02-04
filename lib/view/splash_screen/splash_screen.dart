import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/view/splash_screen/widgets/text_widget.dart';
import 'package:shopx/view_model/controller/splash_screen_controller/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController controller = Get.put(SplashScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.toLoginPage();
    //  controller.setAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TextWidget(),
    );
  }
}
