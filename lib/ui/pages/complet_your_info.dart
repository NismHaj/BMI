import 'package:bmi_app/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'current_status.dart';

class CompleteInfoPage extends StatefulWidget {
  @override
  State<CompleteInfoPage> createState() => _CompleteInfoPageState();
}

class _CompleteInfoPageState extends State<CompleteInfoPage> {
  int groupValue = 1;
  double lengthItemCount = 0;
  double weightItemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                child: SingleChildScrollView(
                    child: Column(children: [
              SizedBox(height: 20),
              Text(
                'Complete Your',
                style: headTextStyle1(),
              ),
              Text(
                'Information',
                style: headTextStyle1(),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headText2Widget('Gender'),
                          SizedBox(
                            height: 40,
                          ),
                          headText2Widget('Weight'),
                          SizedBox(
                            height: 40,
                          ),
                          headText2Widget('Length'),
                          SizedBox(
                            height: 40,
                          ),
                          headText2Widget('Date of Birth'),
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    groupValue = value;
                                    setState(() {});
                                  }),
                              Text(
                                'Male',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              Expanded(child: Container()),
                              SizedBox(
                                width: 30,
                                child: Radio(
                                    value: 2,
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      groupValue = value;
                                      setState(() {});
                                    }),
                              ),
                              const Text(
                                'Female',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              counterIncDec(weightItemCount, (newValue) {
                                setState(() {
                                  weightItemCount = newValue;
                                });
                              }),
                              SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'kg',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              counterIncDec(lengthItemCount, (newValue) {
                                setState(() {
                                  lengthItemCount = newValue;
                                });
                              }),
                              SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'cm',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
                            ),
                          )
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: 80,
              ),
              buttonWidget('Save Data', () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return CurrentStatus();
                }));
              })
            ])))));
  }
}
