import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/routes/pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: baseColor,
      // statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: baseColor,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screentype) {
        return GetMaterialApp(
          title: 'Member Apps',
          theme: ThemeData(
            colorScheme: ColorScheme.light(
              primary: baseColor,
              secondary: yellow,
            ),
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
            fontFamily: 'Signika',
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            fontFamily: 'Signika',
          ),
          themeMode: ThemeMode.light,
          enableLog: true,
          smartManagement: SmartManagement.full,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          getPages: AppPages.pages,
        );
      },
    );
  }
}
