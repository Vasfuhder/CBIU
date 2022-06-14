import 'package:cbiu/client/req_collection.dart';
import 'package:cbiu/screens/admin/home.dart';
import 'package:cbiu/screens/users/home.dart';
import 'package:cbiu/util/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("logo.png"),
          const SizedBox(height: 64),
          field("Username/E-mail", false, widget.controller1),
          const SizedBox(height: 36),
          field("Senha", true, widget.controller2),
          const SizedBox(height: 36),
          SizedBox(
            width: 270,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: HexColor("#62BC8A"),
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: _login,
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox field(String text, bool obscure, TextEditingController controller) {
    return SizedBox(
      width: 500,
      height: 60,
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        textAlign: TextAlign.center,
        autofocus: false,
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: HexColor("#62BC8A"),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: HexColor("#62BC8A"),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: HexColor("#62BC8A"),
            ),
          ),
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _login() async {
    Map res = await login(widget.controller1.text, widget.controller2.text);
    if (res["status"] == 200) {
      if (res["response"]["role"] == "admin") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => AdminHome(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const UsersHome(),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text(
            "Usuário ou senha incorretos!",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          backgroundColor: HexColor("#62BC8A"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }
  }
}
