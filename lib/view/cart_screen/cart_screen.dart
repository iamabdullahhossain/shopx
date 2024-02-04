import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/view_model/controller/cart_screen_controller/cart_screen_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartScreenController controller = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Cart"),
      ),
    );
  }
}
