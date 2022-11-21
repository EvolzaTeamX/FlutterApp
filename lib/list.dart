import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login/Models/Model_Student.dart';
import 'package:login/Services/Services.dart';
import 'package:login/SideBar.dart';
import 'package:login/listItem.dart';
import 'package:http/http.dart' as http;
import 'package:login/studentForm.dart';

class listPage extends StatefulWidget {
  final VoidCallback? onDelete;
  listPage({ this.onDelete});

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  late List<Student>? students = [];
  
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 500), () {
      getStudent();
    });
  }

  void getStudent() async {  //getting students
    students = (await Services.fetchUser())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
           Container(
            child: const Text(
              "List View",
              style: TextStyle(fontSize: 55, color: Colors.white),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  onPressed: () {
                    showDialog( //dialogbox to get inputs
                        context: context,
                        builder: (context) {
                          return StudentForm(operation: "post",refresh: () => initState(),); //init state called to refresh
                        });
                  },
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.add),
                  )),
              Padding(padding: EdgeInsets.all(5)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                        onPressed: () {
                          initState();
                        },
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.refresh),
                        )),
                    Padding(padding: EdgeInsets.all(5)),
                  ],
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Expanded(
            child: ListView.builder(
                itemCount: students?.length,
                itemBuilder: (context, index) {
                  return listItem(
                    studentId: students![index].studentId,
                    studentName: students![index].studentName,
                    objectid: students![index].objectid,
                    refresh: () => initState(),
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
