import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushNamed(context, PageRoutesName.intro);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  spacing: 100,
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.stretch,

  children: [
    SizedBox(height: 150,),
    Image(image: AssetImage(AppAssets.appLogo),
    height: 185,),
const Spacer(),
    Align(
      alignment: Alignment.bottomCenter,
      child: Image(image: AssetImage(AppAssets.copyRightsLogo),
        height: 85,),
    ),
  ],
),
    );
  }
}
