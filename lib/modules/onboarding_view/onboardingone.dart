import 'package:evently/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class OnBoardingViewOne extends StatelessWidget {
  const OnBoardingViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image(image: AssetImage(AppAssets.appLogoBoarding))
          ],
        )
      ),
    );
  }
}