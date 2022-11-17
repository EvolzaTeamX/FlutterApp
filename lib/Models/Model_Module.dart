// To parse this JSON data, do
//
//     final module = moduleFromJson(jsonString);

import 'dart:convert';

List<Module> moduleFromJson(String str) => List<Module>.from(json.decode(str).map((x) => Module.fromJson(x)));

String moduleToJson(List<Module> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Module {
    Module({
        required this.objectid,
        required this.moduleId,
        required this.moduleName,
        required this.moduleDescription,
    });

    String objectid;
    String moduleId;
    String moduleName;
    String moduleDescription;

    factory Module.fromJson(Map<String, dynamic> json) => Module(
        objectid: json["objectid"],
        moduleId: json["moduleId"],
        moduleName: json["moduleName"],
        moduleDescription: json["moduleDescription"],
    );

    Map<String, dynamic> toJson() => {
        "objectid": objectid,
        "moduleId": moduleId,
        "moduleName": moduleName,
        "moduleDescription": moduleDescription,
    };
}