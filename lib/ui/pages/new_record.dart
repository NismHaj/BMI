import 'package:bmi_app/ui/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddRecord extends StatefulWidget {
  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  int groupValue = 1;
  double lengthItemCount = 0;
  double weightItemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Text(
              'New Record',
              style: headTextStyle1(),
            ),
            SizedBox(height: 60.h),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        headText2Widget('Weight'),
                        SizedBox(
                          height: 40.h,
                        ),
                        headText2Widget('Length'),
                        SizedBox(
                          height: 40.h,
                        ),
                        headText2Widget('Date'),
                        SizedBox(
                          height: 40.h,
                        ),
                        headText2Widget('Time'),
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Column(children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Row(
                                children: [
                                  counterIncDec(weightItemCount, (newValue) {
                                    setState(() {
                                      weightItemCount = newValue;
                                    });
                                  }),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  const Text(
                                    'kg',
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              counterIncDec(lengthItemCount, (newValue) {
                                setState(() {
                                  lengthItemCount = newValue;
                                });
                              }),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Text(
                                'cm',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            height: 35.h,
                            child: detailsInputDecorationWidget(),
                          ),
                          SizedBox(
                            height: 35.h,
                            child: detailsInputDecorationWidget(),
                          )
                        ],
                      )
                    ]))
              ],
            ),
            SizedBox(
              height: 80.h,
            ),
            buttonWidget('Save Data', () {})
          ],
        ),
      ),
    );
  }
}
