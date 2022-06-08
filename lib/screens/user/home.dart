import 'package:cbiu/util/hexcolor.dart';
import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: HexColor("#62BC8A"),
        shadowColor: Colors.transparent,
        title: Image.asset("logo_negativa.png"),
        actions: [logout()],
      ),
      drawer: Drawer(
        backgroundColor: HexColor("#ABDDC0"),
        child: ListView(
          children: [
            ListTile(
              title: const Text("Cadastrar Obra"),
              leading: Image.asset("cadastrar_obra.png"),
              textColor: Colors.white,
              onTap: () {},
            ),
            ListTile(
              title: const Text("Cadastrar Usuário"),
              leading: Image.asset("cadastrar_usuario.png"),
              textColor: Colors.white,
              onTap: () {},
            ),
            ListTile(
              title: const Text("Emitir multa"),
              leading: Image.asset("emitir_multa.png"),
              textColor: Colors.white,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: const Center(
        child: Pesquisar(),
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

class Pesquisar extends StatelessWidget {
  const Pesquisar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 802,
      height: 75,
      child: TextField(
        cursorColor: Colors.black,
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 28),
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: HexColor("#62BC8A"),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: HexColor("#62BC8A"),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: HexColor("#62BC8A"),
            ),
          ),
          hintText: "Efetuar uma nova pesquisa",
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 32),
            child: Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}
