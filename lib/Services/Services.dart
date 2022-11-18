import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/Model_Student.dart';
import '../Models/Model_Module.dart';
class Services{
      static Future<List<Student>> fetchUser() async {
          const url = "http://10.0.2.2:8000/flutterapp/api/FindallStudent";
          final uri = Uri.parse(url);


          final response = await http.get(uri);
          final body = response.body;
          final json = jsonDecode(body);
          final student = studentFromJson(response.body);
          return student;
          //print (students[0].studentId);
        
    }
    static Future<dynamic> postUser() async {
     
        const url = "http://10.0.2.2:8000/flutterapp/api/CreateStudent";
        final uri = Uri.parse(url);
        Map data = {
         "objectid" : "0004",
          "studentId" : "SID004",
          "studentName":"Arosha Punchihewa"
        };
        var response = await http.post(uri,body:json.encode(data),headers: {"Content-Type": "application/json"});
        
        print(response.body);
    }
    static Future<dynamic> deleteUser(String objectid) async {
     
        var url = "http://10.0.2.2:8000/flutterapp/api/DeleteStudent?objectid=" + objectid;
        final uri = Uri.parse(url);
     
        var response = await http.delete(uri);
        
        print(response.body);
    }
}