import 'package:evently/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage(AppAssets.appLogo))
        ],
      )
    );
  }
}