import 'dart:convert';

import 'package:matel_login1/auth/model/api_model.dart';
import 'package:http/http.dart' as http;

final _base = "http://192.168.1.25:3000";
final _tokenEndPoint = "/api/auth/signin";
final _tokenURL = _base + _tokenEndPoint;

Future<TokenModel> getToken(UserLoginModel userLoginModel) async {
  print(_tokenURL);

  var _apiURL = Uri.parse(_tokenURL);
  var data = json.encode(userLoginModel.toDatabaseJson());
  print(data);
  final http.Response response = await http.post(
    _apiURL,
    headers: <String, String>{
      "content-Type": "application/json; charset=UTF-8"
    },
    body: data,
  );

  if (response.statusCode == 200) {
    return TokenModel.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
