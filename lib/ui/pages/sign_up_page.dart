import 'package:bmi_app/ui/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Create New Account',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const Text(
                  'If you do not already have an account',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: userController,
                  textInputAction: TextInputAction.next,
                  decoration: textFieldInputDecoration(hintText: 'Name'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: textFieldInputDecoration(hintText: 'E-Mail')),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: textFieldInputDecoration(
                      hintText: 'Password', isPassword: true),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: rePasswordController,
                  obscureText: true,
                  decoration: textFieldInputDecoration(
                      hintText: 'Re-Password', isPassword: true),
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  width: 300,
                  child: buttonWidget('CREATE', () {}),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  height: 15,
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
