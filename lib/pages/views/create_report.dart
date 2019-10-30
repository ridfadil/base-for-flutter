import 'dart:io';

import 'package:base_for_flutter/data/api_service.dart';
import 'package:base_for_flutter/data/constants.dart';
import 'package:base_for_flutter/models/m_token.dart';
import 'package:base_for_flutter/utils/helper/dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CreateReport extends StatefulWidget {
  @override
  _CreateReportState createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  TextEditingController projectId = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  TextEditingController formName = new TextEditingController();
  TextEditingController reportNo = new TextEditingController();
  TextEditingController reportEmployer = new TextEditingController();
  TextEditingController reportExecutor = new TextEditingController();
  TextEditingController reportVendor = new TextEditingController();
  Map<String, String> listValidate = {};
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Report'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GetForm('Project id', projectId,false),
              GetForm('Desc', desc,true),
              GetForm('Form name', formName,false),
              GetForm('Report No', reportNo,true),
              GetForm('Report Employer', reportEmployer,true),
              GetForm('Report Executor', reportExecutor,true),
              GetForm('Report Vendor', reportVendor,true),
              RaisedButton(
                child: Text("Pilih Foto"),
                onPressed: () {
                  getImage();
                },
                color: Colors.red,
                textColor: Colors.yellow,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
              _image == null ? Text('No image selected.') : Image.file(_image),
              RaisedButton(
                child: Text("Create Report"),
                onPressed: () {
                  _validate();
                },
                color: Colors.red,
                textColor: Colors.yellow,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }



  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void _validate() {
    bool post = true;
    listValidate = {
      formName.text: "Harap isi Form name",
      reportNo.text: "Harap isi Report No",
      desc.text: "Harap isi Deskripsi",
      reportEmployer.text: "Harap isi Employer",
      reportExecutor.text: "Harap isi Executor",
      reportVendor.text: "Harap isi Vendor"
    };

    listValidate.forEach((k, v) async {
      if (k == "") {
        post = false;
        Fluttertoast.showToast(msg: v, toastLength: Toast.LENGTH_SHORT);
      }
    });

    if(_image == null){
      post = false;
      Fluttertoast.showToast(msg: 'Silakan upload Foto', toastLength: Toast.LENGTH_SHORT);
    }

    if (post)  _postReport();
  }

  @override
  void initState() {
    super.initState();
    projectId.text = "156";
    formName.text = "general";
    /// no 009 ganti report tidak boleh sama
    reportNo.text = "3.156.GEN.009";
    reportEmployer.text = "PT Perusahaan Gas Negara Tbk";
    reportExecutor.text = "PT PGN Solution";
  }

  @override
  void dispose() {
    formName.dispose();
    reportNo.dispose();
    projectId.dispose();
    reportEmployer.dispose();
    desc.dispose();
    reportExecutor.dispose();
    reportVendor.dispose();
    super.dispose();
  }

  Future _postReport() async{
    MyDialog.loading(context);
    Response response = await ApiService.postReport(
        context: context,
        formname: formName.text,
        desc: desc.text,
        projectid: projectId.text,
        reportno: reportNo.text,
        employer : reportEmployer.text,
        executor : reportExecutor.text,
        vendor : reportVendor.text,
        image : _image,
    );
    MyDialog.dismiss(context);
    return new Future.delayed(new Duration(milliseconds: 0), () {
      if (response.statusCode == APIResponseCode.SUCCESS) {
        var res = new Map<String, dynamic>.from(response.data);
        print(res);
        Fluttertoast.showToast(
            msg: "Berhasil Crate",
            toastLength: Toast.LENGTH_SHORT);
            Navigator.pop(context);
      } else {
        Fluttertoast.showToast(
            msg: response.statusCode.toString() + " - " + response.toString(),
            toastLength: Toast.LENGTH_SHORT);
        return null;
      }
    });
  }

  Widget GetForm(String text, TextEditingController control, bool enable) => Container(
        margin: EdgeInsets.only(top: 8),
        child: TextField(
          controller: control,
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: '$text',
          ),
          enabled: enable,
        ),
      );
}
