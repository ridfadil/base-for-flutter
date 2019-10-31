import 'package:base_for_flutter/models/m_type.dart';
import 'package:flutter/material.dart';
class ItemType extends StatelessWidget {
  final List type;

  const ItemType({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: type.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            ///untuk tekan ke Detail
            ///bisa pakai juga : Gesture Detector
            child: makeCard(type[index], index, context),
            onTap: () {
              print("Panjang : "+type.length.toString());
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailReport(type: type[index],),
                ),
              );*/
            },
          );
        },
      ),
    );
  }

  ///ini Membuat Card
  makeCard(Data types, int index, BuildContext context) => Container(
    margin: EdgeInsets.all(4),
    child: Card(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5.0,
      child: contentList(types, context),
    ),
  );

  ///Ini List dari layout Card layout disesuaikan kebutuhan
  contentList(Data types, BuildContext context) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(types.title ?? 'default if null'),
                Text(types.name ?? 'default if null'),
                Text(types.description ?? 'default if null'),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}