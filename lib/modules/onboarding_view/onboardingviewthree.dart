import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bounceable/flutter_bounceable.dart';
class OnBoardingViewThree extends StatelessWidget {
  const OnBoardingViewThree({super.key,required this.controller});

  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return SafeArea(

        child:
        Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  Center(
                    child: Image(image: AssetImage(AppAssets.appLogoBoarding),
                      width: 159,height: 50,),
                  ),
                  Image(image: AssetImage(AppAssets.onBoardingThree),
                    width: 357,height: 357,),
                  Text("introduction_title3".tr(),style: theme.textTheme.headlineSmall,),
                  Text("introduction_subtitle3".tr()
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
                    Navigator.pushReplacementNamed(context, PageRoutesName.login);
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
          ),
        )

    );
  }

}

