import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import '../../components/buttons.dart';

import './create_player_dialog.dart';

class HomePage extends StatelessWidget {
  void showCreatePlayer(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Create a new player'),
            content: CreatePlayerDialog(),
          );
        });
  }

  void startGame(BuildContext context) {
    Navigator.pushNamed(context, '/newGame');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        color: Color.fromRGBO(230, 206, 255, 1),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Hello',
                  style: highlightedText(context),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RoundedBorderButton(
                  action: showCreatePlayer,
                  text: 'Create a new player',
                ),
                RoundedBorderButton(
                  action: startGame,
                  text: 'Start a new game',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
