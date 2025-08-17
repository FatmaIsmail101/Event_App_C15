import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/map_provider.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/theme/app_theme_manager.dart';
import 'package:evently/core/utils/services/loading_services.dart';
import 'package:evently/core/utils/services/local_storage_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocalStorageServices.init();
  var isFirstTime= LocalStorageServices.getBool("firstSeen")??true;
 await Firebase.initializeApp(
  options:DefaultFirebaseOptions.currentPlatform,

);
  runApp(
      EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>ThemeProvider()),
            ChangeNotifierProvider(create: (_)=>MapProvider())
          ],
          child: MyApp(isFirstTime: isFirstTime,))));
  configLoading();
}

class MyApp extends StatelessWidget {
   const MyApp({super.key,required this.isFirstTime});
final bool isFirstTime;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
        designSize: const Size(393, 793),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
          builder: EasyLoading.init(
            builder: BotToastInit()
          ),
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

