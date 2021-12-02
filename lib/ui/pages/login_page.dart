import 'package:bmi_app/ui/pages/sign_up_page.dart';
import 'package:bmi_app/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: headTextStyle1(),
                ),
                Text(
                  'If you already have an account log in',
                  style: subTextStyle1(),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      // style: TextStyle(
                      //     fontSize: 14.sp, color: const Color(0xff404040)),
                      textInputAction: TextInputAction.next,
                      decoration: textFieldInputDecoration(hintText: 'E-Mail'),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      // style: TextStyle(
                      //     fontSize: 14.sp, color: const Color(0xff404040)),
                      decoration: textFieldInputDecoration(
                          hintText: 'Password', isPassword: true),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                buttonWidget('LOG IN', () {}),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('You Don\'t Hava an Account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return SignUpPage();
                          }));
                        },
                        child: Text('Sign Up'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
