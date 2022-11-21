import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/Models/Model_Module.dart';
import 'package:login/Services/Services.dart';

class ModuleForm extends StatelessWidget {
  final objectId;
  final operation;
  final VoidCallback? refresh;
  ModuleForm({this.objectId,this.operation,this.refresh});

  @override
  Widget build(BuildContext context) {
    final objectidController = TextEditingController(text:objectId );
    final moduleIdController = TextEditingController();
    final moduleNameController = TextEditingController();
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
                    hintText: "Enter Object Id",
                    contentPadding: EdgeInsets.all(20.0),
                    hintStyle: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 118, 116, 116)),
                    labelText: "Object Id",
                    labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(5)),borderSide: BorderSide(color:  Color.fromARGB(255, 255, 107, 1))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)),borderSide: BorderSide(color: Color.fromARGB(255, 255, 107, 1),width: 3)),
                    focusColor: Color.fromARGB(98, 255, 255, 255),
                   ),
                    style: TextStyle(color: Colors.white),
                   controller: objectidController,
                   
               ),
               Padding(padding: EdgeInsets.all(10)),
              TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter Module ID",
                    contentPadding: EdgeInsets.all(20.0),
                    hintStyle: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 118, 116, 116)),
                    labelText: "Module ID",
                    labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(5)),borderSide: BorderSide(color:  Color.fromARGB(255, 255, 107, 1))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)),borderSide: BorderSide(color: Color.fromARGB(255, 255, 107, 1),width: 3)),
                    focusColor: Color.fromARGB(98, 255, 255, 255),
                   ),
                    style: TextStyle(color: Colors.white),
                   controller: moduleIdController,
                 
               ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter Module Name",
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
                   controller: moduleNameController,
                   
              ),
              const Padding(padding: EdgeInsets.all(10)),
               ElevatedButton(onPressed: ()async{
           
                 final newModule =Module(objectid: objectidController.text, moduleId: moduleIdController.text, moduleName: moduleNameController.text, moduleDescription: '');
                 print(newModule);
                 if (operation =='post'){
                    await Services.postModule(newModule);
                

                 }else{
                  await Services.updateModule(newModule);
                    
                 }
                  Navigator.pop(context);
                  return refresh!();
                
               }, child: Text("Submit"))
               
            ],
          ),
        ),
      ),
    );
  }
}