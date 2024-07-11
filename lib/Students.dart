import 'package:flutter/material.dart';
import 'package:flutter_demo/AddStudent.dart';

class Student extends StatelessWidget {
  const Student({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("STUDENTS"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(id: '',)));
      }),
    );
  }
}