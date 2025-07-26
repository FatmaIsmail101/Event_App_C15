import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../core/constants/app_assets.dart';

class OnBoardingViewTwo extends StatelessWidget {
   const OnBoardingViewTwo({super.key,required this.controller});
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
                  Text("introduction_title2".tr(),style: theme.textTheme.headlineSmall,),
                  Text("introduction_subtitle2".tr()
                    ,style: theme.textTheme.bodyLarge,softWrap: true,),
                  Directionality(
                    textDirection: ui.TextDirection.ltr,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            child: Icon(Icons.arrow_back,color: Color(0xff5669FF),
                            ),
                          )),
                        ),
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
                  )


                ],
              ),
            ),
          )

    );
  }
}
