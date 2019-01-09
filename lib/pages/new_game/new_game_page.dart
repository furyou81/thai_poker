import 'package:flutter/material.dart';

import '../../components/buttons.dart';
import './player.dart';
import './add_player_dialog.dart';

import '../../sqflite/database.dart';
import '../../styles/styles.dart';

class NewGamePage extends StatefulWidget {
  final List<String> players;
  final Function addPlayer;
  final Function clearGame;

  NewGamePage({@required this.players, @required this.addPlayer, this.clearGame});

  @override
  State<StatefulWidget> createState() {
    return _NewGamePageState();
  }
}

class _NewGamePageState extends State<NewGamePage> {
// List<String> _players = [];
  DBProvider db = DBProvider.db;
  List<String> allPlayers = [];

  void _getAllPlayers() async {
    List<Map<String, dynamic>> tmp = await db.getPlayers();
    tmp.forEach((p) {
      allPlayers.add(p['username']);
    });
    print(allPlayers);
  }

  @override
  void initState() {
    super.initState();
    widget.clearGame();
    _getAllPlayers();
  }

  void addPlayer(String username) {
    setState(() {
      widget.addPlayer(username);
    });
  }

  void showAddPlayer(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add a player'),
            content: AddPlayerDialog(
              addPlayer: addPlayer,
              allPlayers: allPlayers,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New game'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        //color: Colors.yellow,
        child: Column(
          children: <Widget>[
            RoundedBorderButton(
              action: showAddPlayer,
              text: 'Add a new player',
            ),
            SizedBox(height: 20.0),
            Text('List of players', style: highlightedMediumText(context,)),
            widget.players.length > 0
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) => Player(
                            username: widget.players[index],
                            index: index,
                          ),
                      itemCount: widget.players.length,
                    ),
                  )
                : Center(
                    child: Text('Currently no player was added to this game'),
                  ),
          ],
        ),
      ),
      floatingActionButton: widget.players.length > 1
          ? CenteredFLoatingButton(
              action: () => Navigator.pushNamed(context, '/round'),
              text: 'Play',
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
