import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/theme/app_theme_manager.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,

    );
  }
}

