import 'package:evently/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

class CustomButtonStyle extends StatelessWidget {
  final Color? color;
  final Widget child;
  final VoidCallback? onTap;

   const CustomButtonStyle({
    super.key,
    this.color,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: ColorPallete.primaryColor),
        ),
        onPressed: onTap,
        backgroundColor: color ?? ColorPallete.primaryColor,
        child: child,
        );
    }
}
