import 'package:bmi_app/ui/pages/sign_up_page.dart';
import 'package:bmi_app/ui/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'complet_your_info.dart';

class LogInPage extends StatelessWidget {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Text(
                  'If you already have an account, log in',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: userController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: textFieldInputDecoration(hintText: 'E-Mail'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: textFieldInputDecoration(
                      hintText: 'Password', isPassword: true),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: 300,
                  child: buttonWidget('LOG IN', () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return CompleteInfoPage();
                    }));
                  }),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You Don\'t Hava an Account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return SignUpPage();
                          }));
                        },
                        child: Text('Sign Up'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
