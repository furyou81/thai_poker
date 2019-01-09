import 'package:flutter/material.dart';

class RoundedBorderButton extends StatelessWidget {
  final Function action;
  final String text;

  RoundedBorderButton({@required this.action, @required this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      color: Theme.of(context).accentColor,
      onPressed: () => action(context),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CenteredFLoatingButton extends StatelessWidget {
  final String text;
  final Function action;

  CenteredFLoatingButton({@required this.action, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      padding: EdgeInsets.all(10.0),
      child: SafeArea(
        child: FloatingActionButton(
          shape: BeveledRectangleBorder(),
          heroTag: text,
          onPressed: action,
          child: Text(text),
        ),
      ),
    );
  }
}
