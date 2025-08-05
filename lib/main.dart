import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/theme/app_theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
 await Firebase.initializeApp(
  options:DefaultFirebaseOptions.currentPlatform
);
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: ChangeNotifierProvider(
          create:(context)=> ThemeProvider(),
          child:  MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
        designSize: const Size(393, 793),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(

            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            initialRoute: PageRoutesName.initial,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            theme: AppThemeManager.lightTheme,
            darkTheme: AppThemeManager.darkTheme,
            themeMode: provider.themeMode,
            // optional:
            // themeMode: ThemeMode.system,
          );
          },
    );
    }
}

