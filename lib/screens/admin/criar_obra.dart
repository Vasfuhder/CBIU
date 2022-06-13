import 'package:cbiu/util/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class CriarObra extends StatefulWidget {
  CriarObra({Key? key}) : super(key: key);

  Image image = Image.asset("placeholder2.png");
  List<String> opcoes = ["Admin", "Aluno"];
  String selected = "Aluno";
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  final _formkey4 = GlobalKey<FormState>();
  final _formkey5 = GlobalKey<FormState>();
  final _formkey6 = GlobalKey<FormState>();

  @override
  State<CriarObra> createState() => _CriarObraState();
}

class _CriarObraState extends State<CriarObra> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: 620,
            height: 60,
            decoration: BoxDecoration(
              color: HexColor("#62BC8A"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Cadastrar Nova Obra",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image(
                    image: widget.image.image,
                    fit: BoxFit.contain,
                    width: 290,
                    height: 240,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 253,
                      height: 60,
                      child: botao(
                        "Adicionar capa",
                        () async {
                          var image =
                              (await ImagePickerWeb.getImageAsWidget())!;
                          setState(() => widget.image = image);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 150),
              Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: widget._formkey1,
                        child: field("Nome", false),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: widget._formkey2,
                        child: field("Autor", false),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Form(
                            key: widget._formkey3,
                            child: field2("Ano", false),
                          ),
                          Form(
                            key: widget._formkey4,
                            child: field2("Num de Pag", false),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Form(
                            key: widget._formkey5,
                            child: field2("Edição", false),
                          ),
                          Form(
                            key: widget._formkey6,
                            child: field2("Quant. de Volum.", false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: 250,
            height: 60,
            child: botao("Cadastrar Obra", () {
              if (widget._formkey1.currentState!.validate() &&
                  widget._formkey2.currentState!.validate() &&
                  widget._formkey3.currentState!.validate() &&
                  widget._formkey4.currentState!.validate() &&
                  widget._formkey5.currentState!.validate() &&
                  widget._formkey6.currentState!.validate()) {
                // TODO fazer req
              }
              widget._formkey1.currentState!.validate();
              widget._formkey2.currentState!.validate();
              widget._formkey3.currentState!.validate();
              widget._formkey4.currentState!.validate();
              widget._formkey5.currentState!.validate();
              widget._formkey6.currentState!.validate();
            }),
          )
        ],
      ),
    );
  }

  OutlinedButton botao(String text, VoidCallback callback) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: HexColor("#62BC8A"),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: callback,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  SizedBox field(String text, bool obscure) {
    return SizedBox(
      width: 500,
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Por favor, preencha o campo";
          }
          return null;
        },
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

  SizedBox field2(String text, bool obscure) {
    return SizedBox(
      width: 200,
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Por favor, preencha o campo";
          }
          return null;
        },
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
}
