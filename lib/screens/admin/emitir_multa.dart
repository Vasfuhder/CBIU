import 'package:cbiu/util/hexcolor.dart';
import 'package:flutter/material.dart';

class EmitirMulta extends StatefulWidget {
  const EmitirMulta({Key? key}) : super(key: key);

  @override
  State<EmitirMulta> createState() => _EmitirMultaState();
}

class _EmitirMultaState extends State<EmitirMulta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 500,
      width: 881,
      decoration: BoxDecoration(
        color: HexColor("#62BC8A"),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Emitir multa",
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: field("Nome do usuário", false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: field("Obra", false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: field("Tempo de multa", false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: field("Motivo", false),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 270,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: HexColor("#53876A"),
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Login",
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
          fillColor: Colors.white,
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
          hintStyle: TextStyle(
            color: HexColor("#62BC8A"),
          ),
        ),
      ),
    );
  }
}
