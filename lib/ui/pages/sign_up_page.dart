import 'package:bmi_app/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

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
                  'Create New Account',
                  style: headTextStyle1(),
                ),
                Text(
                  'If you do not already have an account',
                  style: subTextStyle1(),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: userNameController,
                      // style: TextStyle(
                      //     fontSize: 14.sp, color: const Color(0xff404040)),
                      textInputAction: TextInputAction.next,
                      decoration: textFieldInputDecoration(hintText: 'Name'),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
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
                    TextFormField(
                      controller: rePasswordController,
                      obscureText: true,
                      // style: TextStyle(
                      //     fontSize: 14.sp, color: const Color(0xff404040)),
                      decoration: textFieldInputDecoration(
                          hintText: 'Re-Password', isPassword: true),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                buttonWidget('CREATE', () {}),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('You Hava an Account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return LogInPage();
                          }));
                        },
                        child: const Text('LogIn'))
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
