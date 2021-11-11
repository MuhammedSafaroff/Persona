import "package:cloud_firestore/cloud_firestore.dart";
import 'package:persona_application/data/model/test_request_model.dart';
import 'package:persona_application/utils/my_shared_preferences.dart';

class MyFireBaseStore {
  Future<bool> addStore(TestRequestModel data) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String token = await MySharedPreferences().getSharedToken();
    try {
      await _firestore.collection("Tests").doc(token).set(data.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
