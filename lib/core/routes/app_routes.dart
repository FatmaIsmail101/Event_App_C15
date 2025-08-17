import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/modules/authontication/pages/LoginView.dart';
import 'package:evently/modules/authontication/pages/create_account.dart';
import 'package:evently/modules/authontication/pages/rest_password.dart';
import 'package:evently/modules/event_creation/event_creation_view.dart';
import 'package:evently/modules/event_creation/widgets/pick_event_map_screen.dart';
import 'package:evently/modules/layouts/favorite/favorite_view.dart';
import 'package:evently/modules/layouts/home/home_view.dart';
import 'package:evently/modules/layouts/home/widgets/event_details.dart';
import 'package:evently/modules/layouts/layout_view.dart';
import 'package:evently/modules/layouts/map/map_view.dart';
import 'package:evently/modules/layouts/profile/profile_view.dart';
import 'package:evently/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';
import '../../modules/onboarding_view/on_boarding_view.dart';

abstract class AppRoutes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case PageRoutesName.initial:
        return MaterialPageRoute(builder: (_)=>SplashView(),
            settings:settings);

      case PageRoutesName.login:
        return MaterialPageRoute(builder: (_)=>LoginView(),
            settings:settings);
      case PageRoutesName.onBoardingScreen:
        return MaterialPageRoute(builder: (_)=>OnBoardingView(),
            settings:settings);
      case PageRoutesName.layout:
        return MaterialPageRoute(builder: (_)=>LayoutView(),
            settings:settings);

      case PageRoutesName.home:
        return MaterialPageRoute(builder: (_)=>HomeView(),
            settings:settings);
      case PageRoutesName.map:
        return MaterialPageRoute(builder: (_)=>MapView(),
            settings:settings);
      case PageRoutesName.favorite:
        return MaterialPageRoute(builder: (_)=>FavoriteView(),
            settings:settings);

      case PageRoutesName.profile:
        return MaterialPageRoute(builder: (_)=>ProfileView(),
            settings:settings);
      case PageRoutesName.eventCreationView:
        return MaterialPageRoute(builder: (_)=>EventCreationView(),
            settings:settings);

      case PageRoutesName.createAccount:
        return MaterialPageRoute(builder: (_)=>CreateAccount(),
            settings:settings);
      case PageRoutesName.restPass:
        return MaterialPageRoute(builder: (_)=>RestPassword(),
            settings:settings);
      case PageRoutesName.pickEvent:
        return MaterialPageRoute(builder: (_)=>PickEventMapScreen(),
            settings:settings);

      case PageRoutesName.eventDetails:
        return MaterialPageRoute(builder: (_)=>EventDetails(),
            settings:settings);
      default:
        return MaterialPageRoute(builder: (_)=>SplashView());
    }

  }
}

/*
 case PageRoutesName.intro:
        return MaterialPageRoute(builder: (_)=>IntroductionScreen(),
            settings:settings);
 */