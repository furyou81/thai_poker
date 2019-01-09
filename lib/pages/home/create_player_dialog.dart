import 'package:flutter/material.dart';

import '../../utils/form_validation.dart';
import '../../sqflite/database.dart';
import '../../styles/styles.dart';

class CreatePlayerDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatePlayerDialogState();
  }
}

class _CreatePlayerDialogState extends State<CreatePlayerDialog> {
  final GlobalKey<FormState> _createKey = GlobalKey<FormState>();
  bool _submitted = false;
  DBProvider db = DBProvider.db;
  bool _exists = false;

  void _submitForm(BuildContext context) {
    _exists = false;
    if (_createKey.currentState.validate()) {
      _createKey.currentState.save();
    }
    setState(() {
      _submitted = true;
    });
  }

  void _checkIfExists(String value) async {
    bool exists = await db.doesPlayerExists(value.trim());
    print('DOES PLAYER EXISTS');
    print(exists);
    setState(() {
      _exists = exists;
    });
    if (!exists) {
      print(await db.newPlayer(value.trim()));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      //color: Colors.red,
      child: Form(
        key: _createKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              autovalidate: _submitted ? true : false,
              validator: (String value) {
                if (valueIsEmpty(value)) {
                  return "You must put a player name";
                }
              },
              decoration: InputDecoration(
                labelText: 'Player name',
                fillColor: Colors.white,
                filled: true,
              ),
              onSaved: (String value) {
                _checkIfExists(value.trim());
                //widget.addInviteEmail(value.trim());
              },
            ),
            _exists
                ? Text(
                    'This player was already created',
                    style: redText(),
                  )
                : SizedBox(),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                RaisedButton(
                  child: Text('Confirm'),
                  onPressed: () => _submitForm(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
