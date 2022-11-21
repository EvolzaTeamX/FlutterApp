import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/list.dart';
import 'package:login/listItem.dart';
import 'package:login/regPage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:   [
                Container(child: Center(child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),),),),
                Container(
                  child: Image.asset("lib/Assets/avatar2.png"),
                  width: 180,
                  height: 180,
                  padding: EdgeInsets.all(30),
                ),
                const SizedBox(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter User Name",
                      hintStyle: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 118, 116, 116)),
                      labelText: "user name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255)),
                      contentPadding: EdgeInsets.all(20.0),
                      enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(5)),borderSide: BorderSide(color:  Color.fromARGB(255, 255, 107, 1))),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)),borderSide: BorderSide(color: Color.fromARGB(255, 255, 107, 1),width: 3)),
                      focusColor: Color.fromARGB(98, 255, 255, 255)
                      
                    ),
                    style: TextStyle(color: Colors.white)
                  ),
                ),
                Container(child: const Padding(padding: EdgeInsets.all(20),),),
                const SizedBox(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                       contentPadding: EdgeInsets.all(20.0),
                      hintStyle: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 118, 116, 116)),
                      labelText: "Password",
                      labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(5)),borderSide: BorderSide(color:  Color.fromARGB(255, 255, 107, 1))),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)),borderSide: BorderSide(color: Color.fromARGB(255, 255, 107, 1),width: 3)),
                      focusColor: Color.fromARGB(98, 255, 255, 255),
                    ),
                    
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                ),
                Container(child: const Padding(padding: EdgeInsets.all(25),),),
               ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>listPage()));
               }, child: Text("Login"),style: ElevatedButton.styleFrom(minimumSize: Size(400, 50),backgroundColor: Color.fromARGB(246, 219, 87, 20))),
               Container(child: const Padding(padding: EdgeInsets.all(15),),),
               Container(child: Text("Or",style: TextStyle(color: Colors.white),)),
               Container(child: const Padding(padding: EdgeInsets.all(15),),),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   IconButton(onPressed: (){}, icon: Image.asset("lib/Assets/google.png")),
                    Container(child: const Padding(padding: EdgeInsets.all(5),),),
                    IconButton(onPressed: (){}, icon: Image.asset("lib/Assets/facebook.png")),
                 ],
               ),
               Container(child: const Padding(padding: EdgeInsets.all(15),),),
               RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: 'Dont have an account? ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                TextSpan(
                    text: 'Sign up',
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegPage()));
                      }),
              ]),
            ),
              ],
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(244, 49, 46, 46),
      );
  }
}