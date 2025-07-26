import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    spacing: 30.h,
                    children: [
                      Center(
                        child: Image(image: AssetImage(AppAssets.appLogoBoarding),
                          width: 159,height: 50,),
                      ),
                      Image(image: AssetImage(AppAssets.onBoardingOne),
                        width: 357,height: 357,),
                      Text("introduction_title1".tr(),style: theme.textTheme.headlineSmall,),
                      Text("introduction_subtitle1".tr()
                        ,style: theme.textTheme.bodyLarge,softWrap: true,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Bounceable(onTap: (){
                          controller.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);

                        }, child: Directionality(
                          textDirection: ui.TextDirection.ltr,

                          child: Container(
                            width: 37.6,height: 37.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)
                                ,
                              border: Border.all(color: Color(0xff5669FF),
                             )
                            ),
                            child: Icon(Icons.arrow_forward_rounded,color: Color(0xff5669FF),
                            ),
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

