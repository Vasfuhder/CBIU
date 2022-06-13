import 'package:cbiu/client/req_collection.dart';
import 'package:cbiu/util/hexcolor.dart';
import 'package:flutter/material.dart';

class ListarLivros extends StatefulWidget {
  String text;
  ListarLivros({Key? key, required this.text}) : super(key: key);

  @override
  State<ListarLivros> createState() => _ListarLivrosState();
}

class _ListarLivrosState extends State<ListarLivros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: HexColor("#62BC8A"),
        shadowColor: Colors.transparent,
        title: Image.asset("logo_negativa.png"),
      ),
      body: Center(
        child: FutureBuilder(
          future: buscarLivros(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Ocorreu um erro ao se comunicar com a API"),
              );
            }
            if (snapshot.hasData) {
              return Livros(
                data: snapshot.data,
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class Livros extends StatefulWidget {
  dynamic data;
  Livros({Key? key, required this.data}) : super(key: key);

  @override
  State<Livros> createState() => _LivrosState();
}

class _LivrosState extends State<Livros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
