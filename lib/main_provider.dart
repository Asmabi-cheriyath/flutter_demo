// import 'dart:collection';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// class MainProvider1 extends ChangeNotifier {
//   final FirebaseFirestore db = FirebaseFirestore.instance;
//   TextEditingController name3controller = TextEditingController();
//   TextEditingController jobcontroller = TextEditingController();

//   void addStaff(BuildContext context) {
//     String id = DateTime.now().millisecondsSinceEpoch.toString();
//     HashMap<String, Object> map = HashMap();
//     map['Name'] = name3controller.text;
//     map['Job'] = jobcontroller.text;
//     db.collection('STAFF').doc(id).set(map);
//     notifyListeners();
//   }
// }
