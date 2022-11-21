import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login/Models/Model_Student.dart';
import 'package:login/Models/Model_Module.dart';
import 'package:login/ModuleForm.dart';
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
  late List<Module> modules = [];
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      getmodule();
    });
  }

  void getmodule() async {
    modules = (await Services.fetchModule())!;
    setState(() {});
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
          const Text(
            "Grid View",
            style: TextStyle(fontSize: 55, color: Colors.white),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((context) => ModuleForm(
                              operation: "post",
                              refresh: (() => initState()),
                            )));
                  },
                  child: Icon(Icons.add)),
              ElevatedButton(onPressed: () {}, child: Icon(Icons.refresh)),
            ],
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: modules!.length,
                itemBuilder: (context, index) {
                  return GridTile(
                      child: ModuleItem(
                    objectid: modules![index].objectid,
                    moduleId: modules![index].moduleId,
                    moduleName: modules![index].moduleName,
                    refresh: () => initState()
                  ));
                }),
          ),
        ],
      ),
      drawer: SideBar(),
      backgroundColor: Color.fromARGB(244, 49, 46, 46),
    );
  }
}

class ModuleItem extends StatelessWidget {
  final objectid;
  final moduleId;
  final moduleName;
  final VoidCallback? refresh;
  const ModuleItem({this.moduleId, this.moduleName, this.objectid,this.refresh});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        width: 200,
        height: 400,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Align(
            alignment: Alignment.center,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    moduleId,
                    style: TextStyle(color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Text(
                    moduleName,
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: ((context) => ModuleForm(
                                      objectId: objectid,
                                      operation: "put",
                                     
                                    )));
                          },
                          icon: Image.asset("lib/Assets/edit1.png")),
                      IconButton(
                          onPressed: () async {
                            await Services.deleteModule(objectid);
                            return refresh!();
                          },
                          icon: Image.asset("lib/Assets/delete.png"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
