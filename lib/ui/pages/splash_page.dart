import 'package:flutter/material.dart';
import 'add_food_details.dart';
import 'edit_food_details.dart';
import 'food_list.dart';
import 'login_page.dart';

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
        Duration(
          seconds: 2,
        ),
        () {});
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return EditFoodDetails();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/ui/assets/images/bmi_logo.jpg',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
