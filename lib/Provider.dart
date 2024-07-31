import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/model_class.dart';
import 'package:flutter_demo/staffModel.dart';
import 'package:flutter_demo/teacherModel.dart';

class MainProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  //teacher
  TextEditingController name2controller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController phone2controller = TextEditingController();
  //staff
  TextEditingController name3controller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();

  int counter = 0;

  void addStudents(BuildContext context, String Std, String todo) {
    String Id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["Name"] = namecontroller.text;
    map["Phone"] = phonecontroller.text;
    if (todo == 'New') {
      db.collection('STUDENT').doc(Id).set(map);
    } else {
      db.collection("STUDENT").doc(Std).set(map);
      getStudent();
    }
  }

  List<StudentModel> studentlist = [];

  void getStudent() {
    db.collection("STUDENT").get().then((value) {
      if (value.docs.isNotEmpty) {
        studentlist.clear();
        for (var element in value.docs) {
          studentlist.add(StudentModel(
              element.id, element.get("Name"), element.get("Phone")));

          notifyListeners();
        }
      }
    });
  }

  void editStudent(String id) {
    db.collection('STUDENT').doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        namecontroller.text = map['Name'].toString();
        phonecontroller.text = map['Phone'].toString();
        notifyListeners();
      }
    });
  }

  void deleteStudent(String Std, context) {
    db.collection('STUDENT').doc(Std).delete();
    getStudent();
    notifyListeners();
  }

  void addTeachers(BuildContext context, String Std, String todo) {
    String Id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["Name"] = name2controller.text;
    map["Subject"] = subjectcontroller.text;
    map["Phone"] = phone2controller.text;
    if (todo == 'New') {
      db.collection('TEACHER').doc(Id).set(map);
    } else {
      db.collection('TEACHER').doc(Std).update(map);
    }
    getTeachers();
  }

  List<TeacherModel> TeachersList = [];
  void getTeachers() {
    db.collection("TEACHERS").get().then((value) {
      if (value.docs.isNotEmpty) {
        studentlist.clear();
        for (var element in value.docs) {
          TeachersList.add(TeacherModel(element.id, element.get("Name"),
              element.get("Subject"), element.get("Phone")));
          notifyListeners();
        }
      }
    });
  }

  void editTeacher(String id) {
    db.collection('TEACHER').doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        name2controller.text = map['Name'].toString();
        phone2controller.text = map['Phone'].toString();
        subjectcontroller.text = map['subject'].toString();
        notifyListeners();
      }
    });
  }

  void deleteTeacher(String Std, context) {
    db.collection('TEACHER').doc(Std).delete();
    getTeachers();
    notifyListeners();
  }

  void addStaff(BuildContext context ,String std ,String todo) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map['Name'] = name3controller.text;
    map['Job'] = jobcontroller.text;
    if(todo=='new'){

      db.collection('STAFF').doc(id).set(map);

    }else{
      db.collection('STAFF').doc(std).set(map);
      getStaff();
    }
    
    notifyListeners();
  }

  List<StaffModel> stafflist = [];

  void getStaff() {
    db.collection("STAFF").get().then((value) {
      if (value.docs.isNotEmpty) {
        stafflist.clear();
        for (var element in value.docs) {
          stafflist.add(
              StaffModel(element.id, element.get("Name"), element.get("Job")));
          notifyListeners();
        }
      }
    });
  }

  void editStaff(String id){
    db.collection("STAFF").doc(id).get().then((value) {
      if(value.exists){
        Map<dynamic,dynamic> map = value.data()as Map;
        name3controller.text =map["Name"].toString();
        jobcontroller.text = map["Job"].toString();
        notifyListeners();
      }
    });
  }

  void deleteStaff(String std, context){
    db.collection('STAFF').doc(std).delete();
    getStaff();
    notifyListeners();
  }





  void studentClear() {
    namecontroller.clear();
    phonecontroller.clear();
  }

  void teacherClear(){
    name2controller.clear();
    subjectcontroller.clear();
    phone2controller.clear();
  }

  void staffClear(){
    name3controller.clear();
    jobcontroller.clear();
  }
}
