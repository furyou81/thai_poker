import 'package:scoped_model/scoped_model.dart';

import './round_item.dart';

class GameModel extends Model {
  List<String> _players = [];
  List<List<RoundItem>> _rounds = [[]];
  Map<String, String> _bets = Map<String, String>();

  List<String> get players {
    return List.from(_players);
  }

  List<List<RoundItem>> get rounds {
    return List.from(_rounds);
  }

  Map<String, String> get bets {
    print("GET BET");
    print(_bets);
    return Map.from(_bets);
  }

  void addBet(String username, String bet) {
    print("ADDING BET");
    _bets[username] = bet;
    print(_bets);
  }

  void addPlayer(String username) {
    if (!_players.contains(username)) {
      _players.add(username);
    }
  }

  void clearGame() {
    _players.clear();
    _rounds.clear();
    _bets.clear();
  }

  void addRound(List<RoundItem> round) {
    _rounds.add(round);
  }
}
