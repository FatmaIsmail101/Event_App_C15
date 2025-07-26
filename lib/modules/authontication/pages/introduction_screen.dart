import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/widgets/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppAssets.appLogoBoarding,
        width: 159,height: 50,),
        centerTitle: true,toolbarHeight: 85,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.intro1),
              Text(  "introduction_title".tr(),style:theme.textTheme.bodyLarge!.copyWith(
                color: ColorPallete.primaryColor,fontWeight: FontWeight.bold
              ) ,),
              Text("introduction_subtitle".tr(),style: theme.textTheme.bodyMedium),
        
              Row(
        
                children: [
                  Text("language".tr(),style:theme.textTheme.bodyLarge!.copyWith(color:
                  ColorPallete.primaryColor,fontWeight: FontWeight.bold) ,),
                  Spacer(),
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: Container(
                      width: 74.w,height: 31.h,
                      decoration:
                      BoxDecoration(
                        border: Border.all(color: ColorPallete.primaryColor,
                        width: 3,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(25.r)
                      ),
                      child: Row(

                        children: [
                          Bounceable(
                            onTap: (){
                              context.setLocale(Locale('en'));

                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorPallete.primaryColor,
                                        width: 3.r,style: context.locale.toString()=="en"?
                                        BorderStyle.solid:BorderStyle.none),
                                    borderRadius: BorderRadius.circular(35.r)
                                ),
                                child: Image.asset(AppAssets.en)),
                          ),
                          Spacer(),
                          Bounceable(
                            onTap: (){
                              context.setLocale(Locale('ar'));

                            },
                            child: Container(
                              width: 30.w,
                                decoration:  BoxDecoration(

                                    border: Border.all(color: ColorPallete.primaryColor,
                                        width: 3.r,style: context.locale.toString()=="ar"?
                                        BorderStyle.solid:BorderStyle.none),
                                    borderRadius: BorderRadius.circular(35.r)
                                ),
                                child: Image.asset(AppAssets.ar)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
        
                children: [
                  Text("theme".tr(),style:theme.textTheme.bodyLarge!.copyWith(color:
                  ColorPallete.primaryColor,fontWeight: FontWeight.bold) ,),
                  Spacer(),
                  Container(
                    width: 74.w,height: 31.h,
                    decoration:
                    BoxDecoration(
                        border: Border.all(color: ColorPallete.primaryColor,
                            width: 3.r,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(25.r)
                    ),
                    child: Row(
        
                      children: [
                        Container(
                            decoration: BoxDecoration(color: ColorPallete.primaryColor,
                                border: Border.all(color: ColorPallete.primaryColor,
                                    width: 3.r,style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(35)
                            ),
                            child: Image.asset(AppAssets.sun)),
                        Spacer(),
                        Container(
                            decoration:  BoxDecoration(
                                border: Border.all(color: ColorPallete.primaryColor,
                                    width: 3),
                                borderRadius: BorderRadius.circular(35)
                            ),
                            child: Image.asset(AppAssets.moon)),
                        
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 1.sw,
                child: CustomButtonStyle(child: Text("intro_btn".tr()
                ,style: theme.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500
                  )
                ),onTap: (){
                  Navigator.pushNamed(context, PageRoutesName.onBoardingScreen);
                },
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}

