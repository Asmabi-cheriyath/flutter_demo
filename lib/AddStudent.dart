import 'package:flutter/material.dart';
import 'package:flutter_demo/Provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  String id;


  
   HomeScreen({super.key,required this.id});

//   String id;
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
                  child: Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return TextFormField(
                        controller: value.namecontroller,
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      );
                    }
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return TextFormField(
                        controller: value.phonecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          
                        ),
                      );
                    }
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return OutlinedButton(
                      
                      onPressed: () {
                    value.addStudents(context, id);
                      },
                      child: const Text("submit",style: TextStyle(),),
                    );
                  }
                ),
              ],
            ),
          ),
        ));
  }
}
