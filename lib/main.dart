import 'package:bmi_app/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MaterialApp(
    home: ScreenUtilInit(
      builder: () {
        return MyApp();
      },
      designSize: const Size(390, 844),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}
