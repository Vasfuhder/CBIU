import 'package:cbiu/screens/pesquisar.dart';
import 'package:cbiu/screens/users/lista_livros.dart';
import 'package:cbiu/util/hexcolor.dart';
import 'package:flutter/material.dart';

class UsersHome extends StatefulWidget {
  const UsersHome({Key? key}) : super(key: key);

  @override
  State<UsersHome> createState() => _UsersHomeState();
}

class _UsersHomeState extends State<UsersHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: HexColor("#62BC8A"),
        shadowColor: Colors.transparent,
        actions: [logout()],
        title: Image.asset("logo_negativa.png"),
      ),
      body: Center(
        child: Pesquisar(
          callback: (value) => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ListarLivros(text: value),
            ),
          ),
        ),
      ),
    );
  }

  logout() {
    return Container(
      padding: const EdgeInsets.only(right: 32),
      width: 187,
      margin: const EdgeInsets.all(24),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: HexColor("#ABDDC0"),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Logout",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
