// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

List<Student> studentFromJson(String str) => List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
    Student({
        required this.objectid,
        required this.studentId,
        required this.studentName,
    });

    String objectid;
    String studentId;
    String studentName;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        objectid: json["objectid"],
        studentId: json["studentId"],
        studentName: json["studentName"],
    );

    Map<String, dynamic> toJson() => {
        "objectid": objectid,
        "studentId": studentId,
        "studentName": studentName,
    };
}
