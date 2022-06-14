import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> buscarLivros() async {
  var response = await http.get(Uri.parse("http://localhost:8000/books"));
  return jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
}

Future<Map> login(String user, String password) async {
  var response = await http.post(
    Uri.parse("http://localhost:8000/users/login"),
    body: json.encode({'username': user, 'password': password}),
    headers: {'Content-type': 'application/json'},
  );

  return {
    "response": jsonDecode(utf8.decode(response.bodyBytes)) as Map,
    "status": response.statusCode
  };
}
