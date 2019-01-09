import 'package:flutter/material.dart';

TextStyle blankText() {
  return TextStyle(
    color: Colors.white,
  );
}

TextStyle redText() {
  return TextStyle(
    color: Colors.red,
  );
}

TextStyle highlightedMediumText(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).accentColor,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    fontSize: 22.0,
  );
}

TextStyle highlightedText(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).accentColor,
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
  );
}
