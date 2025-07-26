import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/modules/onboarding_view/onboardingone.dart';
import 'package:evently/modules/onboarding_view/onboardingviewtwo.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboardingviewthree.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller=PageController();
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: PageView(
            controller: _controller,
            children: [
              OnBoardingViewOne(controller: _controller,),
              OnBoardingViewTwo(controller: _controller,),
              OnBoardingViewThree(controller: _controller,),

            ],
          )),
          Padding(padding: EdgeInsets.only(bottom: 40),
          child: SmoothPageIndicator(controller: _controller,
              count:3,
          effect: ExpandingDotsEffect(
            activeDotColor: ColorPallete.primaryColor,
            dotColor: ColorPallete.primaryColor,
            dotHeight: 10,
            dotWidth: 10
          ),),
          )

        ],
      )
    );
  }
}
