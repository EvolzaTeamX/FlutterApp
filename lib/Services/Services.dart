import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/Model_Student.dart';
import '../Models/Model_Module.dart';
class Services{
      static Future<List<Student>?> fetchUser() async {
          try{
            const url = "http://10.0.2.2:8000/flutterapp/api/FindallStudent";
            final uri = Uri.parse(url);


            final response = await http.get(uri);
            final body = response.body;
            final json = jsonDecode(body);
            final student = studentFromJson(response.body);
            return student;
            //print (students[0].studentId);
          }catch(e){
            print(e);
            return null;
          }

    }
    static Future<dynamic> postUser(Student student) async {
      try{
        const url = "http://10.0.2.2:8000/flutterapp/api/CreateStudent";
        final uri = Uri.parse(url);
        Map data = {
         "objectid" : student.objectid,
          "studentId" :student.studentId,
          "studentName":student.studentName
        };
        var response = await http.post(uri,body:json.encode(data),headers: {"Content-Type": "application/json"});
        print(student.objectid);
        return response.body;
      }catch(e){
        print(e);      }
    }
    static Future<dynamic> updateUser(Student student) async {
      try{
        var url = "http://10.0.2.2:8000/flutterapp/api/UpdateStudent";
        final uri = Uri.parse(url);
        Map data = {
         "objectid" : student.objectid,
          "studentId" :student.studentId,
          "studentName":student.studentName
        };
        var response = await http.put(uri,body:json.encode(data),headers: {"Content-Type": "application/json"});
        
        return response.body;
      }catch(e){
        print(e);
      }
      
    }
    static Future<dynamic> deleteUser(String objectid) async {
      try{
        var url = "http://10.0.2.2:8000/flutterapp/api/DeleteStudent?objectid=" + objectid;
        final uri = Uri.parse(url);
     
        var response = await http.delete(uri);
        
        return response.body;
      }catch(e){
        print(e);
      }
        
    }

     static Future<List<Module>?> fetchModule() async {
          try{
            const url = "http://10.0.2.2:8000/flutterapp/api/FindallModule";
            final uri = Uri.parse(url);


            final response = await http.get(uri);
            final body = response.body;
            final json = jsonDecode(body);
            final module = moduleFromJson(response.body);
            return module;
            //print (students[0].studentId);
          }catch(e){
            print(e);
            return null;
          }
    }
     static Future<dynamic> postModule(Module module) async {
      try{
        const url = "http://10.0.2.2:8000/flutterapp/api/CreateModule";
        final uri = Uri.parse(url);
        Map data = {
         "objectid" : module.objectid,
          "moduleId" :module.moduleId,
          "moduleName":module.moduleName
        };
        var response = await http.post(uri,body:json.encode(data),headers: {"Content-Type": "application/json"});
        print(response.body);
        return response.body;
      }catch(e){
        print(e);      }
    }
    static Future<dynamic> deleteModule(String objectid) async {
      try{
        var url = "http://10.0.2.2:8000/flutterapp/api/DeleteModule?objectid=" + objectid;
        final uri = Uri.parse(url);
     
        var response = await http.delete(uri);
        
        return response.body;
      }catch(e){
        print(e);
      }
        
    }
     static Future<dynamic> updateModule(Module module) async {
      try{
        var url = "http://10.0.2.2:8000/flutterapp/api/UpdateModule";
        final uri = Uri.parse(url);
        Map data = {
         "objectid" : module.objectid,
          "moduleId" :module.moduleId,
          "moduleName":module.moduleName
        };
        var response = await http.put(uri,body:json.encode(data),headers: {"Content-Type": "application/json"});
        
        return response.body;
      }catch(e){
        print(e);
      }
      
    }
}