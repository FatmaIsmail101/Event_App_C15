import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/widgets/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/theme_provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<String>language=[
    "English",
    "Arabic"
  ];
  List<String>themes=[
    "Light",
    "Dark"
  ];
  @override
  Widget build(BuildContext context) {
    ThemeMode currentTheme = ThemeMode.light;
    var provider = Provider.of<ThemeProvider>(context);
    final theme=Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,height: 156,
              decoration: BoxDecoration(
                color: ColorPallete.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50)
                )
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    width: 124,
                    height: 124,
                    decoration: BoxDecoration(
                      color: ColorPallete.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                        topRight: Radius.circular(1000),
                        bottomLeft: Radius.circular(1000),
                        bottomRight: Radius.circular(1000)
                      )
                    ),
                    child: Image.asset(AppAssets.route),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text("Fatma Ismail",style: theme.textTheme.titleLarge,),
                      Text("fatma@gmail.com",style: theme.textTheme.bodyLarge!.copyWith(
                        color: ColorPallete.white
                      ),)

                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text("Language",style: theme.textTheme.headlineSmall!.copyWith(
                color: ColorPallete.black
              ),),
            ),
            Padding(padding:EdgeInsets.all(16) ,
                child: CustomDropdown<String>(
               decoration: CustomDropdownDecoration(
                 closedFillColor: Colors.transparent,
                 closedBorder: Border.all(
                   color: ColorPallete.primaryColor,
                   
                 ),
                 closedBorderRadius: BorderRadius.all(Radius.circular(16)),
                expandedBorder: BoxBorder.all(
                 color: ColorPallete.primaryColor
               ),
                 closedSuffixIcon: Icon(Icons.keyboard_arrow_down,color: ColorPallete.primaryColor,
                 size: 30,)

               ),
              hintText: 'Select job role',
              items: language,
              initialItem: language[0],
              onChanged: (value) {
                log('changing value to: $value');
                context.setLocale(Locale(value=='English'?"en":"ar"));

              },
            )),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text("Theme",style: theme.textTheme.headlineSmall!.copyWith(
                  color: ColorPallete.black
              ),),
            ),
            Padding(padding:EdgeInsets.all(16) ,
                child: CustomDropdown<String>(
                  decoration: CustomDropdownDecoration(
                      closedFillColor: Colors.transparent,
                      closedBorder: Border.all(
                        color: ColorPallete.primaryColor,

                      ),
                      closedBorderRadius: BorderRadius.all(Radius.circular(16)),
                      expandedBorder: BoxBorder.all(
                          color: ColorPallete.primaryColor
                      ),
                      closedSuffixIcon: Icon(Icons.keyboard_arrow_down,color: ColorPallete.primaryColor,
                        size: 30,)

                  ),

                  hintText: 'Select job role',
                  items: themes,
                  initialItem: themes[0],
                  onChanged: (value) {
                    log('changing value to: $value');
                    provider.changeTheme(value! =="Light"?ThemeMode.light:ThemeMode.dark);

                  },
                )),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(width: 361,
                child: CustomButtonStyle(

                    color: Colors.red,
                    child: Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.logout,color: Colors.white,),
                    ),
                    SizedBox(width: 8,),
                    Text("Logout",style: theme.textTheme.headlineSmall,),
                  ],
                )),
              ),
            )


          ],
        ),
      ),
    );
  }
}
