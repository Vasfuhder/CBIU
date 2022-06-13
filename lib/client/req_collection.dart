import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> buscarLivros() {
  return Future.delayed(
    Duration(milliseconds: 500),
    () => "asd",
  );
}

Future<Map> login(String user, String password) async {
  var response = await http.post(
    Uri.parse("http://localhost:8000/auth/login"),
    body: json.encode({'user': user, 'password': password}),
    headers: {'Content-type': 'application/json'},
  );

  return {
    "response": jsonDecode(utf8.decode(response.bodyBytes)) as Map,
    "status": response.statusCode
  };
}
