import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/Models/Model_Student.dart';
import 'package:login/Models/Model_Module.dart';
import 'package:login/Services/Services.dart';
import 'package:login/SideBar.dart';
import 'package:login/listItem.dart';
import 'package:http/http.dart' as http;

class ModulePage extends StatefulWidget {
  ModulePage({super.key});

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  //final List modules = ["Module 1", "Module 2","Module 3"];
  List<Module> _modules = [];
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Services.getModules().then((modules) => _modules = modules as List<Module>);
    setState(() {
      
    });
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
          Text("Grid View",style: TextStyle(fontSize: 55,color: Colors.white),),
          Padding(padding: EdgeInsets.all(5)),
          Expanded(
            child: GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: _modules.length,
                itemBuilder: (context, index) {
                  return GridTile(child: Module(child: _modules[index],));
                }),
          ),
        ],
      ),
      drawer: SideBar(),
      backgroundColor: Color.fromARGB(244, 49, 46, 46),
    );
  }
}

class Module extends StatelessWidget {
  final child;
  const Module({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        child: Center(child:Text(child,style: TextStyle(color: Colors.white),)),
        width: 200,
        height: 400,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
