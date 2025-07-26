import 'package:evently/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bounceable/flutter_bounceable.dart';
class OnBoardingViewOne extends StatelessWidget {
   const OnBoardingViewOne({super.key,required this.controller});

final PageController controller;
  @override
    Widget build(BuildContext context) {
      final theme=Theme.of(context);
      return SafeArea(

        child:
            Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 30,
                    children: [
                      Center(
                        child: Image(image: AssetImage(AppAssets.appLogoBoarding),
                          width: 159,height: 50,),
                      ),
                      Image(image: AssetImage(AppAssets.onBoardingOne),
                        width: 357,height: 357,),
                      Text("Find Events That Inspire You",style: theme.textTheme.headlineSmall,),
                      Text("Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you."
                        ,style: theme.textTheme.bodyLarge,softWrap: true,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Bounceable(onTap: (){
                          controller.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);

                        }, child: Container(
                          width: 37.6,height: 37.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)
                              ,
                            border: Border.all(color: Color(0xff5669FF),
                           )
                          ),
                          child: Icon(Icons.arrow_forward_rounded,color: Color(0xff5669FF),
                          ),
                        )),
                      )




                    ],
                  ),
                ),
              ),
            )

      );
    }

}

