import 'package:flutter/material.dart';

class TabOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
            children: <Widget> [
              Row(
                  children: <Widget>[
                    Icon(Icons.archive),
                    Text('Artikel Terbaru', style: new TextStyle(fontWeight: FontWeight.bold))
                  ]
              ),
              Card(
                child: Column(
                    children: <Widget>[
                      Image.network('https://images6.alphacoders.com/606/thumb-1920-606263.jpg'),
                      Text('One Piece')
                    ]
                ),
              ),
            ]
        )
    );
  }
}