import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/model/on_boarding_model.dart';
import 'package:evently/modules/onboarding_view/widgets/dot_indicator.dart';
import 'package:evently/modules/onboarding_view/widgets/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/providers/theme_provider.dart';
import '../../core/routes/page_routes_name.dart';
import '../../core/widgets/custom_button_style.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;
  PageController _pageController = PageController();
  void initState() {
    super.initState();
    _pageController.addListener(() {
      currentIndex = _pageController.page!.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode currentTheme = ThemeMode.light;
    var provider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallete.screenLight,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              Image.asset(AppAssets.appLogoBoarding),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  controller: _pageController,
                  itemBuilder: (context, index) => OnBoardingPage(
                    onBoardingData: OnBoardingData.onBoardingList[index],
                  ),
                  itemCount: OnBoardingData.onBoardingList.length,
                ),
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,

                        child:(currentIndex!=0&&currentIndex!=1)? Bounceable(
                          onTap: () {

                            _pageController.animateToPage(currentIndex-1,
                                duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          },
                          child: Container(
                            width: 37.6,
                            height: 37.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Color(0xff5669FF)),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xff5669FF),
                            ),
                          ),
                        ):SizedBox.shrink()
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child:(currentIndex!=0)? Bounceable(
                          onTap: () {

                            _pageController.animateToPage(currentIndex+1,
                                duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                            if(currentIndex==3){

                              _seenOnBoarding();
                            }
                          },
                          child: Container(
                            width: 37.6,
                            height: 37.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Color(0xff5669FF)),
                            ),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: Color(0xff5669FF),
                            ),
                          ),
                        ):SizedBox.shrink()
                      ),
                    ],
                  ),

                  Positioned(
                    left: 100,
                    bottom: 10,
                    child: Row(
                      children: List.generate(
                        OnBoardingData.onBoardingList.length,
                        (index) =>
                            DotIndicator(isActive: index == currentIndex),
                      ),
                    ),
                  ),


                ],
              ),
              Visibility(
                  visible: currentIndex==0,
                  child: Column(
                    spacing: 16,
                    children: [
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
                                Bounceable(
                                  onTap: () {
                                    provider.changeTheme(ThemeMode.light);

                                  },
                                  child: Container(
                                      decoration: BoxDecoration(color: ColorPallete.primaryColor,
                                          border: Border.all(color: ColorPallete.primaryColor,
                                              width: 3.r,style:provider.changeTheme==ThemeMode.light? BorderStyle.solid:BorderStyle.none),
                                          borderRadius: BorderRadius.circular(35)
                                      ),
                                      child: Image.asset(AppAssets.sun)),
                                ),
                                Spacer(),
                                Bounceable(
                                  onTap: () {
                                    provider.changeTheme(ThemeMode.dark);

                                  },
                                  child: Container(
                                      decoration:  BoxDecoration(
                                          border: Border.all(
                                              width: 3,style:provider.changeTheme==ThemeMode.dark? BorderStyle.solid:BorderStyle.none),
                                          borderRadius: BorderRadius.circular(35.r)
                                      ),
                                      child: Image.asset(AppAssets.moon)),
                                ),

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

                          _pageController.animateToPage(currentIndex+1,
                              duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                        },
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _seenOnBoarding() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   sharedPreferences.setBool("firstSeen", false);
   Navigator.pushReplacementNamed(context, PageRoutesName.login);
  }
}
