import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import '../../utils/form_validation.dart';
import '../../sqflite/database.dart';
import '../../styles/styles.dart';

class AddPlayerDialog extends StatefulWidget {
  final Function addPlayer;
  final List<String> allPlayers;

  AddPlayerDialog({@required this.addPlayer, @required this.allPlayers});

  @override
  State<StatefulWidget> createState() {
    return _AddPlayerDialogState();
  }
}

class _AddPlayerDialogState extends State<AddPlayerDialog> {
  final GlobalKey<AutoCompleteTextFieldState<String>> _suggestionKey =
      GlobalKey<AutoCompleteTextFieldState<String>>();
  final GlobalKey<FormState> _createKey = GlobalKey<FormState>();
  bool _submitted = false;
  DBProvider db = DBProvider.db;

  

  void _submitForm(BuildContext context) {
    if (_createKey.currentState.validate()) {
      _createKey.currentState.save();
    }
    setState(() {
      _submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      //color: Colors.red,
      child: Form(
        key: _createKey,
        child: Column(
          children: <Widget>[
            //   DropdownButton<String>(
            //     items: <String>['A', 'B', 'C', 'D'].map((String value) {
            //       return DropdownMenuItem<String>(
            //         value: value,
            //         child: Text(value),
            //       );
            //     }).toList(),
            //     onChanged: (_) {},
            //   ),
            AutoCompleteTextField<String>(
              key: _suggestionKey,
              suggestions: widget.allPlayers,
              itemSubmitted: (String username) {
                print("SUB $username");
                widget.addPlayer(username);
                Navigator.pop(context);
              },
              itemBuilder: (BuildContext context, String username) {
                return Text(username);
              },
              itemFilter: (item, query) {
                return item.toLowerCase().startsWith(query.toLowerCase());
              },
              itemSorter: (String a, String b) {
                a.toUpperCase().compareTo(b.toUpperCase());
                return a.toUpperCase().compareTo(b.toUpperCase());
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
