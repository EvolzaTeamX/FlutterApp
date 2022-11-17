import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/Model_Student.dart';
import '../Models/Model_Module.dart';
class Services{
 static Future<List<Module>> getModules() async {
    
      const url = "http://10.0.2.2:8000/flutterapp/api/FindallModule";
      final uri = Uri.parse(url);


      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final modules = moduleFromJson(response.body);
     
      print (modules[0].moduleId);
      return modules;
    
  }
}