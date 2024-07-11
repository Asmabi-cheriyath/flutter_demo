import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{

  final FirebaseFirestore db=FirebaseFirestore.instance;
  TextEditingController namecontroller=TextEditingController();
    TextEditingController phonecontroller=TextEditingController();
    int counter=0;

    void addStudents(BuildContext context,String Std){
      String Id=DateTime.now().millisecondsSinceEpoch.toString();
      HashMap <String,Object>map=HashMap();
      map["Name"]=namecontroller.text;
      map["Phone"]=phonecontroller.text;
      db.collection("STUDENTS").doc(Id).set(map);
    }


}