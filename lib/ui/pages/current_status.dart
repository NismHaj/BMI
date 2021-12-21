import 'dart:async';
import 'package:bmi_app/helpers/auth_helper.dart';
import 'package:bmi_app/helpers/fire_store_helper.dart';
import 'package:bmi_app/helpers/shared_preferance_helper.dart';
import 'package:bmi_app/models/record_model.dart';
import 'package:bmi_app/provider/firestore_provider.dart';
import 'package:bmi_app/router/app_router.dart';
import 'package:bmi_app/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'add_food_details.dart';
import 'food_list.dart';
import 'login_page.dart';
import 'new_record.dart';

class CurrentStatus extends StatefulWidget {
  @override
  State<CurrentStatus> createState() => _CurrentStatusState();
}

class _CurrentStatusState extends State<CurrentStatus> {
  @override
  void initState() {
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).initCurrentStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(
        builder: (context, firestoreProvider, x) {
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
                        SpHelper.spHelper.getUserInfo().userName,
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
                        child: firestoreProvider.queryRecordSnapshot == null
                            ? const Center(child: CircularProgressIndicator())
                            : firestoreProvider
                                        .queryRecordSnapshot.docs.length <
                                    2
                                ? Text(
                                    firestoreProvider.recordCategory,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20.sp),
                                  )
                                : Text(
                                    firestoreProvider.recordCategory +
                                        '(' +
                                        firestoreProvider
                                            .currentStatusAsString +
                                        ')',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20.sp),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: firestoreProvider.queryRecordSnapshot == null
                          ? const Center(child: CircularProgressIndicator())
                          : firestoreProvider.queryRecordSnapshot.docs.length <
                                  2
                              ? const Center(
                                  child: Text(
                                  'There is no old status yet!',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))
                              : ListView.builder(
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> records =
                                        firestoreProvider
                                            .queryRecordSnapshot.docs.reversed
                                            .toList()[index + 1]
                                            .data();

                                    return oldStatusItemWidget(
                                        date: records[
                                            FirestoreHelper.dateFormatedKey],
                                        recordModel:
                                            RecordModel.fromMap(records));
                                  },
                                  itemCount: firestoreProvider
                                          .queryRecordSnapshot.docs.length -
                                      1,
                                )),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: buttonWidget('Add Food', () {
                        AppRouter.router.pushFunction(AddFoodDetailsPage());
                      })),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: buttonWidget(
                        'Add Record',
                        () {
                          AppRouter.router.pushFunction(AddRecordPage());
                        },
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  buttonWidget('View Food', () {
                    AppRouter.router.pushFunction(FoodListPage());
                  }, width: double.infinity),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        AuthHelper.authHelper.signOut();
                        AppRouter.router
                            .pushWithReplacementFunction(LogInPage());
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
