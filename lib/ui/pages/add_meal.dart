import 'package:bmi_app/helpers/fire_store_helper.dart';
import 'package:bmi_app/helpers/firestorage_Helper.dart';
import 'package:bmi_app/helpers/shared_preferance_helper.dart';
import 'package:bmi_app/models/food_detailed_model.dart';
import 'package:bmi_app/provider/firestore_provider.dart';
import 'package:bmi_app/router/app_router.dart';
import 'package:bmi_app/ui/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddFoodDetailsPage extends StatefulWidget {
  @override
  State<AddFoodDetailsPage> createState() => _AddFoodDetailsPageState();
}

class _AddFoodDetailsPageState extends State<AddFoodDetailsPage> {
  List categories = getCategoriesMealList();
  TextEditingController foodNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String dropDownValue = 'cal/spoon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  'Add Meal Details',
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
                            headText2Widget('Food'),
                            SizedBox(
                              height: 40.h,
                            ),
                            headText2Widget('Amount'),
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
                        child: Column(
                          children: [
                            SizedBox(
                              height: 35.h,
                              child: Container(
                                padding: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: DropdownButton(
                                  iconDisabledColor: Colors.blue,
                                  iconEnabledColor: Colors.blue,
                                  //لشو كلها مش كتير فاهمة
                                  underline: const SizedBox(),
                                  value: dropDownValue,
                                  isExpanded: true,
                                  items: categories.map((e) {
                                    return DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    );
                                  }).toList(),
                                  onChanged: (v) {
                                    dropDownValue = v;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextField(
                                      controller: amountController,
                                      decoration:
                                          detailsInputDecorationWidget()),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    ' unit',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            SizedBox(
                              height: 35.h,
                              child: TextField(
                                decoration: detailsInputDecorationWidget(),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            SizedBox(
                              height: 35.h,
                              child: TextField(
                                decoration: detailsInputDecorationWidget(),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ]),
            )));
  }
}
