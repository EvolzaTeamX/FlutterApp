import 'package:flutter/material.dart';
import 'package:login/Services/Services.dart';
import 'package:login/StudentPage.dart';
import 'package:login/list.dart';

class listItem extends StatelessWidget {
  final studentId;
  final studentName;
  final objectid;
  
  const listItem({this.studentId,this.studentName,this.objectid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child:InkWell(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange),borderRadius: BorderRadius.circular(50)),
          height: 100,
          width: 300,
          //color:  Color.fromARGB(246, 219, 87, 20),
          child: Row(
            children: [
              
              Padding(padding: EdgeInsets.all(5)),
              SizedBox(width:60,child: Image.asset("lib/Assets/avatar2.png")),
              Padding(padding: EdgeInsets.all(5)),
              Text(studentId,style: TextStyle(color: Colors.white),),
              Text(studentName,style: TextStyle(color: Colors.white),),
              const Padding(padding: EdgeInsets.all(5)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  
                  children: [
                     Align(child:SizedBox(width: 40,child: IconButton(icon: Image.asset("lib/Assets/delete.png"),onPressed: (){Services.deleteUser(objectid); },))),
                     Padding(padding: EdgeInsets.all(5)),
                  ],
                ),
              )
             
              
            ],
          )
        ),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>StudentPage(child: studentId)) );
        },
      ),
    );
  }
}
