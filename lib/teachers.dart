import 'package:flutter/material.dart';
import 'package:flutter_demo/add_teacher.dart';
import 'package:flutter_demo/provider.dart';
import 'package:provider/provider.dart';

class Teachers extends StatelessWidget {
  const Teachers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teachers"),
      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.TeachersList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container( height: 100,
                    width: 343,
                      color: Colors.amber,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text("Name : "),
                              Text(value.TeachersList[index].name2)
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Subject : "),
                              Text(value.TeachersList[index].subject),
                              Spacer(),

                              
                              IconButton(
                              onPressed: () {
                                value.editTeacher(
                                    value.TeachersList[index].id);
                          
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => AddTeachers(
                                            id: value
                                                .TeachersList[index].id,
                                            todo: "edit")));
                              },
                              icon: const Icon(Icons.edit)),

                              IconButton(
                              onPressed: () {
                                value.deleteTeacher(value.TeachersList[index].id, context);
                              }, icon: const Icon(Icons.delete)),

                            ],
                          ),
                          Row(
                            children: [
                              const Text("Phone Number : "),
                              Text(value.TeachersList[index].phone2),
                              
                              

                              

                              

                            ],
                          ),
                          
                          
                          
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddTeachers(
                  id: '',
                  todo: 'New',
                )));
      }),
    );
  }
}
