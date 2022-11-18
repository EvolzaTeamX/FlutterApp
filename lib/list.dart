import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login/Models/Model_Student.dart';
import 'package:login/Services/Services.dart';
import 'package:login/SideBar.dart';
import 'package:login/listItem.dart';
import 'package:http/http.dart' as http;

class listPage extends StatefulWidget {
  listPage({super.key});

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  late List<Student>? students = [];
  final List studentids = [];
  final List arr = [
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 6",
    "Student 7"
  ];
  @override
  void initState() {
    // TODO: implement initState
     Future.delayed(const Duration(milliseconds: 500), () {
      getStudent();
  
   });
  }
  void getStudent()async{
    students = (await Services.fetchUser())!;
    setState(() {
      
    });
  }
  void postStudent()async{
    students = await Services.postUser();
    initState();
  }
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          //Align(alignment: Alignment.topLeft,child: BackButton(color: Colors.white,),),
          
          Container(
            child: const Text(
              "List View",
              style: TextStyle(fontSize: 55, color: Colors.white),
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                  onPressed: (postStudent),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Add"),
                  )),
            ],
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Expanded(
                        child: ListView.builder(
                            itemCount: students?.length,
                            itemBuilder: (context, index) {
                              return listItem(
                                studentId:students![index].studentId,
                                studentName: students![index].studentName,
                                objectid: students![index].objectid,
                              );
                            }),
                      )
        ],
      ),
      backgroundColor: Color.fromARGB(244, 49, 46, 46),
      drawer: SideBar(),
    );
  }
}


