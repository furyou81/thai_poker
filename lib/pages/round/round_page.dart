import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/round_item.dart';
import '../../models/game_model.dart';

class RoundPage extends StatefulWidget {
  final List<String> players;
  final List<List<RoundItem>> rounds;
  final Function addRound;
  final Function addBet;
  final Map<String, String> bets;

  RoundPage(
      {@required this.players,
      @required this.rounds,
      @required this.addRound,
      @required this.addBet,
      @required this.bets});

  @override
  State<StatefulWidget> createState() {
    return _RoundPageState();
  }
}

class _RoundPageState extends State<RoundPage> {
  List<TableRow> _rows = [];
  List<String> _betList = ['1', '2', '3', '4', '5', '10', '20'];
  //Map<String, String> _bets = Map<String, String>();
  Map<String, GlobalKey<FormState>> _keys = Map<String, GlobalKey<FormState>>();
  //String _b = "2";

  void _generateKeys() {
    widget.players.forEach((p) {
      _keys[p] = GlobalKey<FormState>();
    });
  }

  void _generateBets() {
    widget.players.forEach((p) {
      if (!widget.bets.containsKey(p)) {
        widget.addBet(p, "1");
      }
    });
  }

  _generateRows() {
    setState(() {
      _keys.forEach((u, k) {
        _rows.add(TableRow(children: [
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Text(u)),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: _newSelect(u, k),
          ),
        ]));
      });
    });
  }

  _generateRowHeader() {
    setState(() {
      _rows.add(
        TableRow(children: [
          TableCell(
            child: Center(
              child: Text('Player'),
            ),
          ),
          TableCell(
            child: Center(
              child: Text('Bet'),
            ),
          ),
        ]),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _generateKeys();
    _generateBets();
    _generateRowHeader();
    _generateRows();
  }

  void setIT(String u, String v) {
    setState(() {
      widget.addBet(u, v);
      _rows.clear();
      _generateRowHeader();
      _generateRows();
    });
  }

  Form _newSelect(String u, GlobalKey<FormState> k) {
    return Form(
      key: k,
      child: FormField(
        builder: (FormFieldState state) {
          return DropdownButtonHideUnderline(
            child: ScopedModelDescendant<GameModel>(
              builder: (BuildContext context, Widget child, GameModel model) {
                return DropdownButton(
                  value: model.bets[u],
                  isDense: true,
                  onChanged: (String value) {
                    print("WDWDWDWm");
                    setState(() {
                      //    _b = value;
                      setIT(u, value);
                      //model.addBet(u, value);
                      //print(widget.bets);
                      //Navigator.pushReplacementNamed(context, '/round');
                      // _bets[u] = value;
                      //  print(value);
                      // print(_bets);
                      // print(_bets[u]);
                    });
                  },
                  items: _betList.map((String v) {
                    return DropdownMenuItem(
                      value: v,
                      child: Text(v),
                    );
                  }).toList(),
                );
              },
            ),
          );
          // );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Round ${widget.rounds.length + 1}'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.yellow,
        child: Table(
          //border: TableBorder.all(
          // width: 1.0,
          // color: Colors.black,
          // ),
          children: _rows,
        ),
      ),
    );
  }
}
