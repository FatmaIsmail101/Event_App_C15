import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/color_pallete.dart';
import '../../../core/widgets/custom_button_style.dart';

class RestPassword extends StatelessWidget {
  const RestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPallete.screenLight,
        centerTitle: true,
        title: Text("Forget Password",style: theme.textTheme.titleLarge!.copyWith(
            color: ColorPallete.black,fontWeight: FontWeight.w500
        ),),
        iconTheme: IconThemeData(
            color: ColorPallete.black
        ),
      ),
      backgroundColor: ColorPallete.screenLight,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Image.asset(AppAssets.restPass),
            SizedBox(
              width: double.infinity,
              child: CustomButtonStyle(
                child: Text(
                  "Rest Password",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
