import 'package:flutter/material.dart';

import 'SideBar.dart';

class StudentPage extends StatelessWidget {
  final child;

  const StudentPage({this.child});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(5),child: Container(height: 100,color: Colors.orange,child: Center(child: Text("Student Details",style: TextStyle(fontSize: 24,color: Colors.white),),),),),
          Padding(padding: EdgeInsets.all(5),child: Container(height: 200,color: Colors.orange,child: Center(
            child: SizedBox(width: 100,child: Image.asset("lib/Assets/avatar2.png")),
          ),),),
          Expanded(child: Padding(padding: EdgeInsets.all(5),child: Container(height: 100,color: Colors.orange,child: Center(child: Text(child,style: TextStyle(fontSize: 24,color: Colors.white),),),),)),
        ],
      ),
      backgroundColor: Colors.black,
      drawer: SideBar(),
    );
  }
}