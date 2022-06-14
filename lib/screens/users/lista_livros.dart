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
      body: SingleChildScrollView(
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
                data: snapshot.data as List<dynamic>,
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
  List<dynamic> data;
  Livros({Key? key, required this.data}) : super(key: key);

  @override
  State<Livros> createState() => _LivrosState();
}

class _LivrosState extends State<Livros> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        widget.data.length,
        (index) => Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(24),
            constraints: const BoxConstraints(maxHeight: 500, maxWidth: 300),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "placeholder2.png",
                    scale: 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.data[index]["nome"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: HexColor("#62BC8A"),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Reservar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
