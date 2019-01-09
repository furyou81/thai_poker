import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// PAGES
import './pages/home/home_page.dart';
import './pages/new_game/new_game_page.dart';
import './pages/round/round_page.dart';

// MODELS
import './models/game_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<GameModel>(
      model: GameModel(),
      child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            // primaryColor: Color.fromRGBO(179, 157, 219, 1),
            // accentColor: Color.fromRGBO(131, 111, 169, 1),
            primaryColor: Colors.orange,
            accentColor: Colors.blue,
            primarySwatch: Colors.red,
            textTheme: Theme.of(context).textTheme.apply(
                //       bodyColor: Colors.pink,
                //       displayColor: Colors.pink,
                fontFamily: "Kanit"),
          ),
          routes: {
            '/': (BuildContext context) => HomePage(),
            '/newGame': (BuildContext context) {
              return ScopedModelDescendant<GameModel>(
                builder: (BuildContext context, Widget child, GameModel model) {
                  return NewGamePage(
                    players: model.players,
                    addPlayer: model.addPlayer,
                    clearGame: model.clearGame,
                    initEarning: model.initEarning,
                  );
                },
              );
            },
            '/round': (BuildContext context) {
              return ScopedModelDescendant<GameModel>(
                rebuildOnChange: true,
                builder: (BuildContext context, Widget child, GameModel model) {
                  return RoundPage(
                    players: model.players,
                    rounds: model.rounds,
                    addRound: model.addRound,
                    addBet:  model.addBet,
                    bets: model.bets,
                  );
                },
              );
            },
          }),
    );
  }
}
