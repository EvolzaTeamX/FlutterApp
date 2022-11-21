import 'package:flutter/material.dart';
import 'package:login/Models/Model_Student.dart';
import 'package:login/Services/Services.dart';

class StudentForm extends StatelessWidget {
 
  final operation;
  final objectid;
  final VoidCallback? refresh;
   StudentForm({super.key, this.operation,this.objectid,this.refresh});
 

  var response;

  
  var newObjectIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final objectidController = TextEditingController(text: objectid);
    final studentIdController = TextEditingController();
    final studentNameController = TextEditingController();
    return AlertDialog(
      backgroundColor:  Color.fromARGB(244, 49, 46, 46),
      title: Text("Enter Student details",style: TextStyle(color: Colors.white),),
      content: Container(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children:  [
              TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter Object ID",
                    contentPadding: EdgeInsets.all(20.0),
                    hintStyle: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 118, 116, 116)),
                    labelText: "Object ID",
                    labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(5)),borderSide: BorderSide(color:  Color.fromARGB(255, 255, 107, 1))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)),borderSide: BorderSide(color: Color.fromARGB(255, 255, 107, 1),width: 3)),
                    focusColor: Color.fromARGB(98, 255, 255, 255),
                   ),
                   style: TextStyle(color: Colors.white),
                   controller:objectidController,
               ),
               Padding(padding: EdgeInsets.all(10)),
              TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter Student ID",
                    contentPadding: EdgeInsets.all(20.0),
                    hintStyle: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 118, 116, 116)),
                    labelText: "Student ID",
                    labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(5)),borderSide: BorderSide(color:  Color.fromARGB(255, 255, 107, 1))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)),borderSide: BorderSide(color: Color.fromARGB(255, 255, 107, 1),width: 3)),
                    focusColor: Color.fromARGB(98, 255, 255, 255),
                   ),
                    style: TextStyle(color: Colors.white),
                   controller: studentIdController,
               ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter Student Name",
                    contentPadding: EdgeInsets.all(20.0),
                    hintStyle: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 118, 116, 116)),
                    labelText: "Student Name",
                    labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(5)),borderSide: BorderSide(color:  Color.fromARGB(255, 255, 107, 1))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)),borderSide: BorderSide(color: Color.fromARGB(255, 255, 107, 1),width: 3)),
                    focusColor: Color.fromARGB(98, 255, 255, 255),
                   ),
                    style: TextStyle(color: Colors.white),
                   controller: studentNameController,
              ),
              const Padding(padding: EdgeInsets.all(10)),
               ElevatedButton(onPressed: ()async{
             
                   final newStudent = Student(objectid: objectidController.text, studentId: studentIdController.text, studentName: studentNameController.text);
                  if (operation == "post"){
                    
                    response =  await Services.postUser(newStudent);
                   
                  }else{
                 
                    response = await Services.updateUser(newStudent);
                    //print(objectidController.text);
                  }
                    Navigator.pop(context);
                    showDialog(context: context, builder: ((context) => AlertDialog(title: Text("Response"),content: Text(response),)));

                    return refresh!();
                 
               }, child: Text("Submit"))
               
            ],
          ),
        ),
      ),
    );
  }
}