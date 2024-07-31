import 'package:flutter/material.dart';
import 'package:flutter_demo/add_teacher.dart';
import 'package:flutter_demo/main_provider.dart';
import 'package:flutter_demo/provider.dart';
import 'package:flutter_demo/staff.dart';
import 'package:flutter_demo/students.dart';
import 'package:flutter_demo/teachers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(onTap: (){
                  value.getTeachers();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Teachers()));
                },
                  child: Container(height: 35,width: 100,color: Colors.amber,
                          child: Center(child: Text("Teachers",style: TextStyle(fontSize: 20),)),
                          
                          ),
                );
              }
            ),
          ),
        Consumer<MainProvider>(
          builder: (context,value,child) {
            return InkWell(onTap: (){
              value.getStudent();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Student()));
            },
              child: Container(height: 35,width: 100,color: Colors.amber,
              child: Center(child: Text("Students",style: TextStyle(fontSize: 20)),
              
              ),
              ),
            );
          }
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return InkWell(onTap: (){
                value.getStaff(); 
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Staff()));
              },
                child: Container(height: 35,width: 100,color: Colors.amber,
                child: Center(child: Text("Others",style: TextStyle(fontSize: 20)),
                
                ),
                ),
              );
            }
          ),
        ),

        ],
        ),
      ),
    );
  }
}