import 'dart:io';
import 'package:bmi_app/helpers/fire_store_helper.dart';
import 'package:bmi_app/helpers/shared_preferance_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreProvider extends ChangeNotifier {
  String currentStatusAsString = '';
  double currentStatusAsDouble = 0.0;
  String recordCategory = '';
  File file;
  QuerySnapshot<Map<String, dynamic>> queryRecordSnapshot;
  QuerySnapshot<Map<String, dynamic>> queryFoodSnapshot;

  initCurrentStatus() async {
    queryRecordSnapshot = await getUserRecords();
    currentStatusAsString = queryRecordSnapshot.docs.last
        .data()[FirestoreHelper.currentStatusAsStringKey];
    recordCategory =
        queryRecordSnapshot.docs.last.data()[FirestoreHelper.recordCategoryKey];
    currentStatusAsDouble = queryRecordSnapshot.docs.last
        .data()[FirestoreHelper.currentStatusAsDoubleKey];
    notifyListeners();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserRecords() async {
    return await FirestoreHelper.firestoreHelper
        .getUserRecordsById(SpHelper.spHelper.getUserInfo().email);
  }

  initUserFoodList() async {
    queryFoodSnapshot = await FirestoreHelper.firestoreHelper
        .getUserFoodListById(SpHelper.spHelper.getUserInfo().email);
    notifyListeners();
  }

  deleteFoodFromFoodList(docId) async {
    await FirestoreHelper.firestoreHelper
        .deleteFoodFromFoodList(SpHelper.spHelper.getUserInfo().email, docId);
    initUserFoodList();
  }

  selectFile() async {
    XFile imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
        // الاميج بيكر مكتبة بتفتح الاستيديو انو هاي الصورة بدي اياها من الجلري و بتاخد الصورة ع شكل اكس فايل ر
    file = File(imageFile.path);
    //باخد الباث مسار الصورة و بخزنو بالفايل  يعني بخزن ع شكل فايل ليس سترينج كيف خزنتها بالفير ستوريج و ليس الفير بيس
    //هيك احنا بس اخترنا الصورة ا عرضناها
    notifyListeners();
  }
}
