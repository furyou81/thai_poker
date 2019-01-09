import 'package:scoped_model/scoped_model.dart';

import './round_item.dart';

class GameModel extends Model {
  List<String> _players = [];
  List<List<RoundItem>> _rounds = [[]];
  Map<String, String> _bets = Map<String, String>();
  Map<String, int> _earnings = Map<String, int>();

  List<String> get players {
    return List.from(_players);
  }

  List<List<RoundItem>> get rounds {
    return List.from(_rounds);
  }

  Map<String, String> get bets {
    return Map.from(_bets);
  }

  Map<String, int> get earnings {
    return Map.from(_earnings);
  }

  void addBet(String username, String bet) {
    print("ADDING BET");
    _bets[username] = bet;
  }

  void initEarning(String username) {
    print("init earning");
    _earnings[username] = 0;
    print(_earnings);
  }

  void addEarning(String username, int earning) {
    print("ADDING EARNING");
    print(_earnings[username]);
    _earnings[username] += earning;
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
    _earnings.clear();
  }

  void addRound(List<RoundItem> round) {
    _rounds.add(round);
  }
}
