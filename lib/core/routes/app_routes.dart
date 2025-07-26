import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/modules/authontication/pages/LoginView.dart';
import 'package:evently/modules/onboarding_view/onboardingscreen.dart';
import 'package:evently/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../../modules/onboarding_view/onboardingone.dart';
import '../../modules/onboarding_view/onboardingviewtwo.dart';

abstract class AppRoutes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case PageRoutesName.initial:
        return MaterialPageRoute(builder: (_)=>SplashView(),
            settings:settings);
      case PageRoutesName.onBoardingScreen:
        return MaterialPageRoute(builder: (_)=>OnBoardingScreen(),
            settings:settings);


      case PageRoutesName.login:
        return MaterialPageRoute(builder: (_)=>LoginView(),
            settings:settings);

      default:
        return MaterialPageRoute(builder: (_)=>SplashView());
    }

  }
}