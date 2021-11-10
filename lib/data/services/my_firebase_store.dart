// import "package:cloud_firestore/cloud_firestore.dart";
// import "package:flutter/cupertino.dart";
// import "package:flutter/material.dart";
// import 'package:vstore_appl/data/models/store_model.dart';
// import 'package:vstore_appl/presentation/app.dart';
// import 'package:vstore_appl/core/utils/my_shared_preferences.dart';

// class MyFireBaseStore {
//   static addStore(
//       String storeName, String catagory, BuildContext context) async {
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     String token = await MySharedPreferences().getSharedToken();
//     try {
//       _firestore.collection("Store").doc(token).set({
//         "storeName": storeName,
//         "catagory": catagory,
//         "image":
//             "https://firebasestorage.googleapis.com/v0/b/vstore-7528c.appspot.com/o/defaultImage%2Fprofile_image.jpg?alt=media&token=ee78e9a0-2703-404f-a8f4-82f15964a2da",
//         "coverImage":
//             "https://firebasestorage.googleapis.com/v0/b/vstore-7528c.appspot.com/o/defaultImage%2Fcover_image.jpg?alt=media&token=c6a8e4d2-cc54-4dc7-bf60-d4eb6cf7cc30",
//         "product": {"products": []},
//         "follower": {"followers": []},
//         "rating": 0,
//         "contact": {
//           "aboutStore": "",
//           "tel": "",
//           "email": "",
//           "latlng": "",
//           "adress": "",
//           "internetAdress": {
//             "facebook": "",
//             "instagram": "",
//             "twitter": "",
//             "whatsapp": "",
//           }
//         }
//       }).then((value) async {
//         await _firestore.collection("Person").doc(token).update({
//           "doYouHaveAStore": true,
//         }).then((result) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => App(
//                 index: 0,
//                 name: "do_u_have_a_market",
//               ),
//             ),
//           );
//         }).catchError((onError) {
//           print(onError);
//         });
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<StoreModel> getStore(String token) async {
//     StoreModel storeModel = StoreModel();
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//     DocumentSnapshot documentSnapshot =
//         await _firestore.collection("Store").doc(token).get();

//     if (documentSnapshot.exists) {
//       var value = documentSnapshot.data();
//       storeModel = StoreModel.fromJson(value!);
//     }
//     return storeModel;
//   }
// }
