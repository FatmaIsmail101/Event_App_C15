import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

class OnBoardingViewTwo extends StatelessWidget {
   OnBoardingViewTwo({super.key,required this.controller});
final PageController controller;
  @override
  Widget build(BuildContext context) {
     final theme=Theme.of(context);
    return SafeArea(

      child:
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Center(
                    child: Image(image: AssetImage(AppAssets.appLogoBoarding),
                      width: 159,height: 50,),
                  ),
                  Image(image: AssetImage(AppAssets.onBoardingTwo),
                    width: 357,height: 357,),
                  Text("Effortless Event Planning",style: theme.textTheme.headlineSmall,),
                  Text("Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests."
                    ,style: theme.textTheme.bodyLarge,softWrap: true,),


                ],
              ),
            ),
          )

    );
  }
}