import 'package:tier_faang/utils/network.dart';

import '../common/config.dart';
import '../common/db.dart';
import '../models/base.dart';

class User {
  String dbName = USERS_DB;
  NetworkUtil _netUtil = new NetworkUtil();
  // DatabaseHelper _db = new DatabaseHelper();

  int id;
  String _username;
  String _apiToken;
  String _loggedIn;
  String _streak;
  String _streakSubject;
  int _points;
  int _currentSessionId;

  User(this.id, this._username, this._apiToken, this._loggedIn, this._streak,
      this._streakSubject, this._points, this._currentSessionId);

  // User.map(dynamic obj) {
  //   this.id = obj["id"] != null ? obj["id"] : 0;
  //   this._username = obj["username"];
  //   this._apiToken = obj["apiToken"];
  //   this._loggedIn = obj["loggedIn"];
  //   this._streak = obj["streak"];
  //   this._streakSubject = obj["streakSubject"];
  //   this._points = obj["points"];
  //   this._currentSessionId = obj["currentSessionId"];
  // }

  //Updating Local DB
  // User.updatePoints(int points) {
  //   print("update Points in DB");
  //   print(points);
  //   _db.findOneAndUpdate(this.dbName, '1', [], {'points': points});
  // }

  String get username => _username;
  String get apiToken => _apiToken;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["apiToken"] = _apiToken;
    map["loggedIn"] = _loggedIn;
    map["streak"] = _streak;
    map["streakSubject"] = _streakSubject;
    map["points"] = _points;

    return map;
  }

  // Future<void> create() async {
  //   this.id = await db.create(this);
  //   return;
  // }

  // Future<void> update() async {
  //   db.update(this.dbName, this.toMap(), this.id);
  // }

  // Future<void> logout() async {
  //   await db.clear();
  //   return;
  // }

  Future<dynamic> sendToServerForUpdating(String currentStat) async {
    String token = this.apiToken;
    String sessionId = this._currentSessionId.toString();
    var url = '$API/status?api_token=$token';
    var now = DateTime.now();
    print("sending from user.dart");
    print(url);
    return _netUtil.post(url, body: {
      "points": this._points,
      "username": this._username,
      "streak": this._streak,
      "streakSubject": this._streakSubject,
      "session_id": sessionId
    }).then((dynamic res) {
      return res;
    }).catchError((e) {
      return e;
    });
  }
}
