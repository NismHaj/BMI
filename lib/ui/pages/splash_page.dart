import 'package:bmi_app/helpers/shared_preferance_helper.dart';
import 'package:bmi_app/router/app_router.dart';
import 'package:bmi_app/ui/pages/complet_your_info.dart';
import 'package:bmi_app/ui/pages/current_status.dart';
import 'package:bmi_app/ui/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigateToHomeScreen();
  }

  navigateToHomeScreen() async {
    await Future.delayed(
        const Duration(
          seconds: 2,
        ),
        () {});
    AppRouter.router.pushWithReplacementFunction(
        SpHelper.spHelper.getUserLoggedInState() == true
            ? CurrentStatus()
            : SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf7f7f7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/ui/assets/images/bmi_logo.png',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
