import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/add_staff.dart';
import 'package:flutter_demo/provider.dart';
import 'package:provider/provider.dart';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STAFF"),
      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.stafflist.length,
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
                              Text(value.stafflist[index].name3),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              const Text("Job : "),
                              Text(value.stafflist[index].job),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    value.editStaff(value.stafflist[index].id);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => AddStaff(
                                                id: value.stafflist[index].id,
                                                todo: "edit")));
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    value.deleteStaff(
                                        value.stafflist[index].id, context);
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
            builder: (context) => AddStaff(
                  id: '',
                  todo: 'new',
                )));
      }),
    );
  }
}
