import 'package:cbiu/util/hexcolor.dart';
import 'package:flutter/material.dart';

class Pesquisar extends StatelessWidget {
  Function callback;

  Pesquisar({Key? key, required this.callback}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 802,
      height: 75,
      child: TextField(
        controller: controller,
        onSubmitted: ((value) => callback(value)),
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
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 32),
            child: InkWell(
              onTap: () => callback(controller.text),
              child: const Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
