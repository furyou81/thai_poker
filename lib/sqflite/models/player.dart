import 'dart:convert';

Player playerFromJson(String str) {
    final jsonData = json.decode(str);
    return Player.fromJson(jsonData);
}

String playerToJson(Player data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Player {
    int id;
    String username;
    
    Player({
        this.id,
        this.username,
    });

    factory Player.fromJson(Map<String, dynamic> json) => new Player(
        id: json["id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
    };
}