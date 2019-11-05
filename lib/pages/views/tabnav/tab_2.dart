import 'package:flutter/material.dart';

class TabTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
            children: <Widget> [
              Row(
                  children: <Widget>[
                    Icon(Icons.archive),
                    Text('Artikel Populer', style: new TextStyle(fontWeight: FontWeight.bold))
                  ]
              ),
              Card(
                child: Column(
                    children: <Widget>[
                      Image.network('https://img.inews.id/media/822/files/inews_new/2019/10/11/onepiece__1_.jpg'),
                      Text('One Piece')
                    ]
                ),
              ),
            ]
        )
    );
  }
}