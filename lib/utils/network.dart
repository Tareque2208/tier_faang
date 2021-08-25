import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  Future<dynamic> get(String url, {Map? headers, body, encoding}) {
    return http.get(Uri.parse(url)).then((http.Response response) {
      final String res = response.body;

      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      return jsonDecode(res);
    });
  }

  Future<dynamic> post(String url, {headers, body, encoding}) {
    print("POST METHOD FOR SENDING FROM NETWORK.DART");
    print(body);
    return http
        .post(Uri.parse(url), body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final res = response.body;
      final int statusCode = response.statusCode;
      print('RESPONSE FROM NETWORK.DART');
      print(res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception(
            "Error while fetching data in posting $statusCode $res ");
      }
      return {"status": "success", "res": jsonDecode(res)};
    }).catchError((e) {
      print('got error');
      print(e.toString());
      return {"status": "error", "error": e.toString()};
    });
  }
}
