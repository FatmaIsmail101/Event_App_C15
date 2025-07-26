import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/constants/app_string.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.intro1),
              Text(AppStrings.personalizeYourExperience.tr(),style:theme.textTheme.bodyLarge!.copyWith(
                color: ColorPallete.primaryColor,fontWeight: FontWeight.bold
              ) ,),
              Text(AppStrings.introSubTitle.tr(),style: theme.textTheme.bodyMedium),
        
              Row(
        
                children: [
                  Text(AppStrings.language.tr(),style:theme.textTheme.bodyLarge!.copyWith(color:
                  ColorPallete.primaryColor,fontWeight: FontWeight.bold) ,),
                  Spacer(),
                  Container(
                    width: 74,height: 31,
                    decoration:
                    BoxDecoration(
                      border: Border.all(color: ColorPallete.primaryColor,
                      width: 3,style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Row(
        
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorPallete.primaryColor,
                                    width: 3,style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(35)
                            ),
                            child: Image.asset(AppAssets.en)),
                        Spacer(),
                        Container(
                            decoration:  BoxDecoration(
                                border: Border.all(color: ColorPallete.primaryColor,
                                    width: 3),
                                borderRadius: BorderRadius.circular(35)
                            ),
                            child: Image.asset(AppAssets.ar))
                      ],
                    ),
                  )
                ],
              ),
              Row(
        
                children: [
                  Text(AppStrings.theme.tr(),style:theme.textTheme.bodyLarge!.copyWith(color:
                  ColorPallete.primaryColor,fontWeight: FontWeight.bold) ,),
                  Spacer(),
                  Container(
                    width: 74,height: 31,
                    decoration:
                    BoxDecoration(
                        border: Border.all(color: ColorPallete.primaryColor,
                            width: 3,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Row(
        
                      children: [
                        Container(
                            decoration: BoxDecoration(color: ColorPallete.primaryColor,
                                border: Border.all(color: ColorPallete.primaryColor,
                                    width: 3,style: BorderStyle.solid),
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
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      backgroundColor: ColorPallete.primaryColor,
                      foregroundColor: ColorPallete.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      )
                    ),
                    onPressed: (){
                  Navigator.pushReplacementNamed(context, PageRoutesName.onBoardingScreen);
                }, child: Text(AppStrings.introBTN)
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
