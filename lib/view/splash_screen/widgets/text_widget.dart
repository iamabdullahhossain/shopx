import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text(
          "SHOPX",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ).animate().fade(duration: const Duration(milliseconds: 300)),
      ),
    );
  }
}