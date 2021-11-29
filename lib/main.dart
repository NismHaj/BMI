import 'package:flutter/material.dart';
import 'ui/pages/splash_page.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}
