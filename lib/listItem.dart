import 'package:flutter/material.dart';
import 'package:login/StudentPage.dart';

class listItem extends StatelessWidget {
  final studentId;
  final studentName;
  
  const listItem({this.studentId,this.studentName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child:InkWell(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange),borderRadius: BorderRadius.circular(50)),
          height: 100,
          
          //color:  Color.fromARGB(246, 219, 87, 20),
          child: Row(
            children: [
              
              Padding(padding: EdgeInsets.all(5)),
              SizedBox(width:60,child: Image.asset("lib/Assets/avatar2.png")),
              Padding(padding: EdgeInsets.all(5)),
              Text(studentId,style: TextStyle(color: Colors.white),),
              Text(studentName,style: TextStyle(color: Colors.white),)
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
