import 'package:flutter/material.dart';
import 'package:flutter_demo/provider.dart';
import 'package:provider/provider.dart';

class AddStudents extends StatelessWidget {
  String id , todo;
  AddStudents({super.key, required this.id, required this.todo});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ADD STUDENT"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Consumer<MainProvider>(builder: (context, value, child) {
                    return TextFormField(
                      controller: value.namecontroller,
                      decoration:
                          const InputDecoration(
                            hintText: "Enter Your Name",
                            border: OutlineInputBorder()),
                    );
                  }),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Consumer<MainProvider>(builder: (context, value, child) {
                    return TextFormField(
                      controller: value.phonecontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter Your Phone Number",
                        border: OutlineInputBorder(),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<MainProvider>(builder: (context, value, child) {
                  return OutlinedButton(
                    onPressed: () {
                      value.addStudents(context, id ,todo);
                      value.getStudent();
                      if(value!=null){

                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Student Data is Added")));

                      }
                      value.studentClear();
                      
                      


                    },
                    child: const Text(
                      "submit",
                      style: TextStyle(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
