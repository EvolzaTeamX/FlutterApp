import 'package:flutter/material.dart';
import 'package:login/ModulePage.dart';
import 'package:login/list.dart';
import 'package:login/loginPage.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) =>Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [buildHeader(context),buildMenu(context)],
      ),
    ),
  );
}

Widget buildHeader(BuildContext context) =>Container(
    
);
Widget buildMenu(BuildContext context) =>Column(
    children: [
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text("Home"),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>listPage()) );
        },
      ),
       ListTile(
        leading: const Icon(Icons.book),
        title: const Text("Modules"),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>ModulePage()) );
        },
      ),
        ListTile(
        leading: const Icon(Icons.login),
        title: const Text("Sign Out"),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()) );
        },
      ),
      
    ],
);