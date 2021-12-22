import 'package:bmi_app/helpers/fire_store_helper.dart';

class FoodDetailsModel {
  String imageUrl;
  String foodName;
  String foodCategory;
  String foodCalory;
  String amountCat;
  FoodDetailsModel.fromMap(Map map) {
    imageUrl = map[FirestoreHelper.imageUrlKey];
    foodName = map[FirestoreHelper.foodNameKey];
    foodCalory = map[FirestoreHelper.foodCaloryKey];
    foodCategory = map[FirestoreHelper.foodCategoryKey];
    amountCat = map[FirestoreHelper.amountCatKey];
  }
  FoodDetailsModel(
      {this.imageUrl,
      this.foodName,
      this.foodCategory,
      this.foodCalory,
      this.amountCat});
  toMap() {
    return {
      FirestoreHelper.imageUrlKey: imageUrl,
      FirestoreHelper.foodNameKey: foodName,
      FirestoreHelper.foodCategoryKey: foodCategory,
      FirestoreHelper.foodCaloryKey: foodCalory,
      FirestoreHelper.dateOfAddingKey: DateTime.now(),
      FirestoreHelper.amountCatKey: amountCat
    };
  }
}
