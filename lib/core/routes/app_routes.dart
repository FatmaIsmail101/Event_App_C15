import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/modules/authontication/pages/LoginView.dart';
import 'package:evently/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../../modules/authontication/pages/introduction_screen.dart';
import '../../modules/onboarding_view/onboardingscreen.dart';

abstract class AppRoutes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case PageRoutesName.initial:
        return MaterialPageRoute(builder: (_)=>SplashView(),
            settings:settings);
      case PageRoutesName.intro:
        return MaterialPageRoute(builder: (_)=>IntroductionScreen(),
            settings:settings);
      case PageRoutesName.login:
        return MaterialPageRoute(builder: (_)=>LoginView(),
            settings:settings);
      case PageRoutesName.onBoardingScreen:
        return MaterialPageRoute(builder: (_)=>OnBoardingScreen(),
            settings:settings);

      default:
        return MaterialPageRoute(builder: (_)=>SplashView());
    }

  }
}