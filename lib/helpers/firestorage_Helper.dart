import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirestorageHelper {
  FirestorageHelper._();
  static FirestorageHelper firestorageHelper = FirestorageHelper._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  //بتحول الصورة من فايل لسترينج
  Future<String> uploadImage(File file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last; //هاتلي مسار الصورة من بعد /
    String path = 'images/foods/$fileName'; //المسار بالفير ستوري
    Reference reference = firebaseStorage.ref(path);
    await reference.putFile(file); //رجعلي مسار الصورة
    String imageUrl = await reference
        .getDownloadURL(); //انا بس حطيت مسار الصورة كاسم ما خزنت الصورة لسا اعطيني مرجع من التوريج و هادة المرجع حط فيه الصورة انا هلقيت خزنت الصورة
    return imageUrl; //و باخد الصورة ع شكل يو ار ال سترينج
  }
}
