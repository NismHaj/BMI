import 'package:bmi_app/provider/firestore_provider.dart';
import 'package:bmi_app/router/app_router.dart';
import 'package:bmi_app/ui/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'helpers/shared_preferance_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPrefrence();
  runApp(ChangeNotifierProvider<FirestoreProvider>(
      create: (context) => FirestoreProvider(),
      child: MaterialApp(
        navigatorKey: AppRouter.router.routerKey,
        theme: ThemeData(
            primaryColor: Colors.blue,
            scaffoldBackgroundColor: const Color(0xfffafafa)),
        home: ScreenUtilInit(
          builder: () {
            return FirebaseConfiguration();
          },
          designSize: const Size(390, 844),
        ),
      )));
}

class FirebaseConfiguration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      builder: (context, snapShot) {
        if (snapShot.hasError) {
          return Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Text(snapShot.error.toString()),
            ),
          );
        }
        if (snapShot.connectionState == ConnectionState.done) {
          return SplashPage();
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
      future: Firebase.initializeApp(),
    );
  }
}
