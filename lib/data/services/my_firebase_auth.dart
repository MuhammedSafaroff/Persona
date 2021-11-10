import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/screens/home_page.dart';

class MyFireBaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserEmailandPassword(String email, String password,
      String fullName, BuildContext context) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      MySharedPreferences().addSharedToken(user.user!.uid);
      _firestore.collection('Person').doc(user.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'gender': '',
        'phoneNumber': '',
        'photeURL':
            'https://firebasestorage.googleapis.com/v0/b/vstore-7528c.appspot.com/o/defaultImage%2Fprofile_image.jpg?alt=media&token=ee78e9a0-2703-404f-a8f4-82f15964a2da',
        'doYouHaveAStore': false
      });
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()));
    } on FirebaseAuthException catch (error) {}
  }

  Future<void> signInEmailandPassword(
      String email, String password, BuildContext context) async {
    BuildContext myContext =
        ProgressAlertDialog(context).showProgressAlertDialog();
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      MySharedPreferences().addSharedToken(user.user!.uid);
      Navigator.of(myContext, rootNavigator: true).pop();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => App()),
          (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: false).pop();
      DialogPlatformCtrl(
        title: 'Error',
        myContent: Text(error.message!),
        context: context,
        yesButton: 'OK',
        yesButtonFun: () {
          Navigator.of(context).pop();
        },
      ).platformCtrlDialog();
    }
  }

  Future<String> myProfileUpdate(ProfileModel data) async {
    await _firestore.collection('Person').doc(data.token).update({
      "fullName": data.fullName,
      "phoneNumber": data.phoneNumber,
      "gender": data.gender,
      "photeURL": data.photeUrl
    }).then((result) {
      return "new USer true";
    }).catchError((onError) {
      return "onError";
    });
    return "";
  }
}
