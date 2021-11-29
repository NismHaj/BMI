import 'package:bmi_app/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class CurrentStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Mohammed',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                headText2Widget('Current Status'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    'Normal (still good)',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                headText2Widget('Old Status'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        oldStatusItemWidget(),
                        oldStatusItemWidget(),
                        oldStatusItemWidget(),
                        oldStatusItemWidget(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(child: buttonWidget('Add Food', () {})),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: buttonWidget(
                      'Add Record',
                      () {},
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                buttonWidget('View Food', () {}, width: double.infinity),
                SizedBox(height: 20),
                Center(
                  child: const Text(
                    'Logout',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
