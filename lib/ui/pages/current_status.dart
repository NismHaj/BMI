import 'package:bmi_app/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentStatus extends StatefulWidget {
  @override
  State<CurrentStatus> createState() => _CurrentStatusState();
}

class _CurrentStatusState extends State<CurrentStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Mohammed',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                headText2Widget('Current Status'),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Center(
                      child: Text(
                    'Normal (still Good!)',
                    style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                  )),
                ),
                SizedBox(
                  height: 20.h,
                ),
                headText2Widget('Old Status'),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.r)),
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
                  height: 30.h,
                ),
                Row(
                  children: [
                    Expanded(child: buttonWidget('Add Food', () {})),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: buttonWidget(
                      'Add Record',
                      () {},
                    )),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                buttonWidget('View Food', () {}, width: double.infinity),
                SizedBox(
                  height: 20.h,
                ),
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
