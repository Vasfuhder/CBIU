import 'package:cbiu/util/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class CadastrarUsuario extends StatefulWidget {
  CadastrarUsuario({Key? key}) : super(key: key);

  Image image = Image.asset("placeholder.png");
  List<String> opcoes = ["Admin", "Aluno"];
  String selected = "Aluno";
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  final _formkey4 = GlobalKey<FormState>();

  @override
  State<CadastrarUsuario> createState() => _CadastrarUsuarioState();
}

class _CadastrarUsuarioState extends State<CadastrarUsuario> {
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
              "Criar Novo Usuário",
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
                        "Add foto",
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
              Column(
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
                      child: field("Senha", true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: widget._formkey3,
                      child: field("Matrícula/SIPAC", false),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      alignment: Alignment.center,
                      width: 500,
                      height: 55,
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: HexColor("#62BC8A"),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: HexColor("#62BC8A"),
                        ),
                        child: DropdownButton(
                          isExpanded: true,
                          style: const TextStyle(color: Colors.white),
                          underline: const SizedBox(),
                          items: List.generate(
                            widget.opcoes.length,
                            (index) => DropdownMenuItem(
                              value: widget.opcoes[index],
                              child: Center(
                                child: Text(
                                  widget.opcoes[index],
                                ),
                              ),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() => widget.selected = value!);
                          },
                          value: widget.selected,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: widget._formkey4,
                      child: field("Curso/setor", false),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: 250,
            height: 60,
            child: botao("Criar Usuário", () {
              if (widget._formkey1.currentState!.validate() &&
                  widget._formkey2.currentState!.validate() &&
                  widget._formkey3.currentState!.validate() &&
                  widget._formkey4.currentState!.validate()) {
                // TODO fazer req
              }
              widget._formkey1.currentState!.validate();
              widget._formkey2.currentState!.validate();
              widget._formkey3.currentState!.validate();
              widget._formkey4.currentState!.validate();
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
}
