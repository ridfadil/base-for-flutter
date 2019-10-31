import 'dart:convert';
class TypeResponse {
  List<Data> dataList;

  TypeResponse({this.dataList});

  TypeResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataList = new List<Data>();
      json['data'].forEach((v) {
        dataList.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataList != null) {
      data['data'] = this.dataList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String name;
  String code;
  String title;
  String status;
  String description;
  String unit;

  Data(
      {this.name,
        this.code,
        this.title,
        this.status,
        this.description,
        this.unit});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    title = json['title'];
    status = json['status'];
    description = json['description'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['title'] = this.title;
    data['status'] = this.status;
    data['description'] = this.description;
    data['unit'] = this.unit;
    return data;
  }
}