import 'package:flutter/material.dart';
import 'package:flutter_demo/provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddTeachers extends StatelessWidget {
  String id, todo;

  AddTeachers({super.key, required this.id, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD TEACHERS"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<MainProvider>(builder: (context, value, child) {
              return TextFormField(
                controller: value.name2controller,
                decoration: const InputDecoration(
                    hintText: "Name", border: OutlineInputBorder()),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<MainProvider>(builder: (context, value, child) {
              return TextFormField(
                controller: value.subjectcontroller,
                decoration: const InputDecoration(
                    hintText: "Subject", border: OutlineInputBorder()),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<MainProvider>(builder: (context, value, child) {
              return TextFormField(
                controller: value.phone2controller,
                decoration: const InputDecoration(
                    hintText: "Phone Number", border: OutlineInputBorder()),
              );
            }),
          ),
          Consumer<MainProvider>(builder: (context, value, child) {
            return OutlinedButton(
                onPressed: () {
                  value.addTeachers(context, id ,todo);
                  value.getTeachers();
                  value.teacherClear();

                  if (value != null) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Teacher Data is Added")));
                  }
                },
                child: const Text("Save"));
          }),
        ],
      ),
    );
  }
}
