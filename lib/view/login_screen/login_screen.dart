import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopx/view/login_screen/widgets/input_password_widget.dart';
import 'package:shopx/view/login_screen/widgets/input_username_widget.dart';
import 'package:shopx/view/login_screen/widgets/login_button_widget.dart';
import 'package:shopx/view_model/controller/login_screen_controller/login_screen_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenController controller = Get.put(LoginScreenController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Headline Text:
                const Center(
                    child: Text(
                  "ShopX",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),

                const Gap(50),

                //Username Text Field:
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InputUsernameWidget(controller: controller),
                ),

                //Password Text Field:
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InputPasswordWidget(controller: controller),
                ),
                LoginButtonWidget(formKey: formKey, controller: controller)
                //Login Button:

              ],
            ),
          ),
        ),
      ),
    );
  }
}
