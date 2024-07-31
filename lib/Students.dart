import 'package:flutter/material.dart';
import 'package:flutter_demo/add_student.dart';
import 'package:flutter_demo/provider.dart';
import 'package:provider/provider.dart';

class Student extends StatelessWidget {
  const Student({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STUDENTS"),
      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.studentlist.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 188, 205, 220),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text("Name : "),
                              Text(value.studentlist[index].name),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              const Text("Phone Number : "),
                              Text(value.studentlist[index].phone),

                              Spacer(),

                              IconButton(
                              onPressed: () {
                                value.editStudent(value.studentlist[index].id);

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AddStudents(
                                        id: value.studentlist[index].id,
                                        todo: "edit")));
                              },
                              icon: const Icon(Icons.edit)),
                              IconButton(
                              onPressed: () {
                                value.deleteStudent(
                                    value.studentlist[index].id, context);
                              },
                              icon: const Icon(Icons.delete))
                            ],
                          ),
                          
                          
                        ],
                      ),
                    )),
              );
            }));
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddStudents(
                  id: '',
                  todo: 'New',
                )));
      }),
    );
  }
}
