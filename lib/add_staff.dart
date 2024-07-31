import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/provider.dart';
import 'package:provider/provider.dart';

class AddStaff extends StatelessWidget {
  String id,todo;
   AddStaff({super.key ,required this.id,required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: const Text("ADD STAFF"),
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
                      controller: value.name3controller,
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
                      controller: value.jobcontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter Your Job",
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
                      value.addStaff(context,id,todo);
                      value.getStaff();
                      value.staffClear();
                    
                      if(value!=null){

                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Staff Data is Added")));

                      }
                     
                      
                      


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
        )
    );
  }
}