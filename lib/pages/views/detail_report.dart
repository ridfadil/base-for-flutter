import 'package:flutter/material.dart';
import 'package:base_for_flutter/models/m_report.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailReport extends StatefulWidget {
  ///terima parameter Model Report
  final Data report;

  const DetailReport({Key key, this.report}) : super(key: key);

  ///send param
  @override
  _DetailReportState createState() => _DetailReportState(report: report);
}

class _DetailReportState extends State<DetailReport> {
  ///receive param
  final Data report;
  bool show = false;
   String _btnText;

  _DetailReportState({this.report});

  @override
  void initState() {
    super.initState();
    _btnText ="Show All";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Form'),
      ),

      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            InkWell(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            setRow("Approver",report.approver),
                            setRow("Executor",report.executor),
                            setRow("Location",report.location),
                            setRow("Inputter",report.inputter),

                            show? setRow("Employer",report.employer) : Container(),
                            show? setRow("Created",report.created) : Container(),
                            show? setRow("Approver Date",report.approverDate) : Container(),
                            show? setRow("submitted",report.submitted) : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              child: new Text('$_btnText'),
              onPressed: () {
                setState(() {
                  show = !show;
                  show?_btnText = "Dont Show" : _btnText = "Show All";
                });
                Fluttertoast.showToast(
                    msg: report.approver.toString() +
                        "\n" +
                        report.executor.toString() +
                        "\n" +
                        report.location.toString() +
                        "\n" +
                        report.inputter.toString() +
                        "\n" +
                        report.employer.toString() +
                        "\n",
                    toastLength: Toast.LENGTH_SHORT);
              },
            ),
          ],
        ),
      ),
    );
  }

  ///prosedur widget
  Widget setRow(String name, String value)=>Row(
    textDirection: TextDirection.ltr,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          child: Text('$name : ') ,
        ),
      ),

      Expanded(
        flex: 1,
        child: Container(
          child: Text('$value') ,
        ),
      ),
    ],
  );
}
