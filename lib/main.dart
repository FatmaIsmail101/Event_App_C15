import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/theme/app_theme_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,

    );
  }
}

