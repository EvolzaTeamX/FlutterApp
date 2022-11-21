import 'package:flutter/material.dart';
import 'package:login/Services/Services.dart';
import 'package:login/StudentPage.dart';
import 'package:login/list.dart';
import 'package:login/studentForm.dart';

class listItem extends StatelessWidget {
  final studentId;
  final studentName;
  final objectid;
  final VoidCallback? refresh;

  const listItem(
      {this.studentId, this.studentName, this.objectid, this.refresh});
 
  @override
  Widget build(BuildContext context) {
     String response;
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(50)),
            height: 100,
            width: 600,
            //color:  Color.fromARGB(246, 219, 87, 20),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                SizedBox(
                    width: 60, child: Image.asset("lib/Assets/avatar2.png")),
                Padding(padding: EdgeInsets.all(5)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ID : " + studentId,
                        maxLines: 2,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Name :" + studentName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Align(
                              child: SizedBox(
                                  width: 45,
                                  child: IconButton(
                                    icon: Image.asset("lib/Assets/edit1.png"),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return StudentForm(
                                              operation: "put",
                                              objectid: objectid,
                                            );
                                          });
                                    },
                                  ))),
                          //Padding(padding: EdgeInsets.all(2)),
                          Align(
                              child: SizedBox(
                                  width: 45,
                                  child: IconButton(
                                    icon: Image.asset("lib/Assets/delete.png"),
                                    onPressed: () {
                                      response = Services.deleteUser(objectid).toString();
                                      showDialog(context: context, builder: ((context) => const AlertDialog(
                                        title: Text("Response"),
                                        content: Text("Item Deleted"),
                                      )));
                                      return refresh!();
                                    },
                                  ))),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                    ],
                  ),
                )
              ],
            )),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StudentPage(child: studentId)));
        },
      ),
    );
  }
}
