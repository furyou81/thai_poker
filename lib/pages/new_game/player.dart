import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final String username;
  final int index;

  Player({this.username, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        Text((index + 1).toString()),
        SizedBox(
          width: 10.0,
        ),
        Text(username),
      ]),
    );
  }
}
