import 'package:flutter/material.dart';

import '../colors/app_colors.dart';


class RoundBTN extends StatelessWidget {
  final Widget label;
  final VoidCallback onClick;
  final double height, width;
  final bool loading;
  final Color textColor, buttonColor;

  const RoundBTN({
    super.key,
    required this.label,
    required this.onClick,
    this.height = 50,
    this.width = 50,
    this.loading = false,
    this.textColor = AppColors.black,
    this.buttonColor = AppColors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
        ),
        child: label
      ),
    );
  }
}
