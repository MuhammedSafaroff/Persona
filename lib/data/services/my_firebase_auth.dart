import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/screens/home_page.dart';
import 'package:persona_application/utils/my_shared_preferences.dart';

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
    } on FirebaseAuthException catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(error.message!),
            actions: <Widget>[
              TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        },
      );
    }
  }

  Future<void> signInEmailandPassword(
      String email, String password, BuildContext context) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      MySharedPreferences().addSharedToken(user.user!.uid);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(error.message!),
            actions: <Widget>[
              TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        },
      );
    }
  }
}
