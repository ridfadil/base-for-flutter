import 'package:flutter/material.dart';

class Tabthree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
            children: <Widget> [
              Row(
                  children: <Widget>[
                    Icon(Icons.archive),
                    Text('Berita Terbaru', style: new TextStyle(fontWeight: FontWeight.bold))
                  ]
              ),
              Card(
                child: Column(
                    children: <Widget>[
                      Image.network('https://www.genpi.co/timthumb.php?src=http://fs.genpi.co//uploads/data/images/2019/09/ONE%20PIECE.jpg&w=820&a=br&zc=1'),
                      Text('One Piece')
                    ]
                ),
              ),
            ]
        )
    );
  }
}