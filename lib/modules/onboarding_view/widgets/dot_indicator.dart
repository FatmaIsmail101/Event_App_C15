import 'package:evently/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
   DotIndicator({super.key,required this.isActive});
bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width:isActive?21: 8,height: 8,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color:isActive?ColorPallete.primaryColor: ColorPallete.grey
      ),
    );
  }
}
