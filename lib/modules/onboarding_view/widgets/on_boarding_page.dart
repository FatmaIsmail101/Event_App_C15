import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/model/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key,required this.onBoardingData});
final OnBoardingData onBoardingData;
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1,
            child: Image.asset(onBoardingData.imgPath)),
        Text(onBoardingData.title,style: theme.textTheme.headlineSmall!.copyWith(
          color: ColorPallete.primaryColor,fontWeight: FontWeight.bold
        ),),
        Text(onBoardingData.description,style: theme.textTheme.bodyLarge,),

      ],
    );
  }
}
