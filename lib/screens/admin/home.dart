import 'package:cbiu/screens/admin/cadastrar_usuario.dart';
import 'package:cbiu/screens/admin/criar_obra.dart';
import 'package:cbiu/screens/admin/emitir_multa.dart';
import 'package:cbiu/screens/login.dart';
import 'package:cbiu/screens/pesquisar.dart';
import 'package:cbiu/util/hexcolor.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  PageController controller = PageController(initialPage: 0);

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
          shrinkWrap: true,
          children: [
            ListTile(
              title: const Text("Home"),
              leading: Container(
                color: HexColor("#62BC8A"),
                child: const Icon(
                  Icons.home_filled,
                  color: Colors.white,
                ),
              ),
              textColor: Colors.white,
              onTap: () {
                controller.jumpToPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Cadastrar Usuário"),
              leading: Image.asset("cadastrar_usuario.png"),
              textColor: Colors.white,
              onTap: () {
                setState(() {
                  controller.jumpToPage(1);
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Cadastrar Obra"),
              leading: Image.asset("cadastrar_obra.png"),
              textColor: Colors.white,
              onTap: () {
                setState(() {
                  controller.jumpToPage(2);
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Emitir multa"),
              leading: Image.asset("emitir_multa.png"),
              textColor: Colors.white,
              onTap: () {
                setState(() {
                  controller.jumpToPage(3);
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Center(
              child: Pesquisar(
            callback: (_) {},
          )),
          Center(child: CadastrarUsuario()),
          Center(child: CriarObra()),
          const Center(child: EmitirMulta())
        ],
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
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        },
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
