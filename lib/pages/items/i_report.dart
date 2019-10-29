import 'package:base_for_flutter/models/m_report.dart';
import 'package:base_for_flutter/pages/views/detail_report.dart';
import 'package:flutter/material.dart';

class ItemReport extends StatelessWidget {
  final List report;

  const ItemReport({Key key, this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: report.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            ///untuk tekan ke Detail
            ///bisa pakai juga : Gesture Detector
            child: makeCard(report[index], index, context),
            onTap: () {
              print("Panjang : "+report.length.toString());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailReport(report: report[index],),
                ),
              );
            },
          );
        },
      ),
    );
  }

  ///ini Membuat Card
  makeCard(Data reports, int index, BuildContext context) => Container(
    margin: EdgeInsets.all(4),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 5.0,
          child: contentList(reports, context),
        ),
      );

  ///Ini List dari layout Card layout disesuaikan kebutuhan
  contentList(Data reports, BuildContext context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(reports.workDesc ?? 'default if null'),
                    Text(reports.employer ?? 'default if null'),
                    Text(reports.vendor ?? 'default if null'),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
