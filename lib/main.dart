import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safara_apk/core/route/app_router.dart';

void main() {
  runApp(const Main());
}

void _applyTheme() {
  // Later Update:
  // This function is used to apply the theme to the app or specificly
  // this widget will handle the theme change based on the system settings.

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive design
    Size screenSize = MediaQuery.of(context).size;

    return ScreenUtilInit(
        designSize: screenSize,
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        builder: (_, Widget? child) {
          // Apply theme before building the MaterialApp
          _applyTheme();

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
            //TODO : Integrate Light and Dark Theme
            // theme: AppTheme.lightTheme,
            // darkTheme: AppTheme.darkTheme,
          );
        });
  }
}
