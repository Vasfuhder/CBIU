import 'package:cbiu/screens/user/home.dart';
import 'package:cbiu/util/hexcolor.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

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
          field("Username/E-mail", false),
          const SizedBox(height: 36),
          field("Senha", true),
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
              onPressed: login,
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

  SizedBox field(String text, bool obscure) {
    return SizedBox(
      width: 500,
      height: 60,
      child: TextField(
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

  void login() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const UserHome(),
      ),
    );
  }
}
