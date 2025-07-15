import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bounceable/flutter_bounceable.dart';
class OnBoardingViewThree extends StatelessWidget {
  OnBoardingViewThree({super.key,required this.controller});

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
                  Image(image: AssetImage(AppAssets.onBoardingOne),
                    width: 357,height: 357,),
                  Text("Connect with Friends & Share Moments",style: theme.textTheme.headlineSmall,),
                  Text("Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories."
                    ,style: theme.textTheme.bodyLarge,softWrap: true,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Bounceable(onTap: (){
                      controller.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.ease);
                    Navigator.pushNamed(context, PageRoutesName.login);

                      }, child: Container(
                        width: 52,height: 52,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:theme.primaryColor,
                            border: Border.all(color: theme.primaryColor,
                                width: 2)
                        ),
                        child: Icon(Icons.arrow_forward_rounded,color: theme.primaryColor,
                        ))),
                  )




                ],
              ),
            ),
          ),
        )

    );
  }

}

