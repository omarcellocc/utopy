import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//widget para criar campos de input
class InputField extends StatelessWidget {
  const InputField(
      {required this.hint, required this.obscure, required this.icon});
  final String hint;
  final bool obscure;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      //decorando a borda do container
      decoration: const BoxDecoration(
          //borda do container
          border: Border(
              bottom: BorderSide(
        color: Colors.white24, //cor
        width: 0.5, //largura
      ))),
      // caracterizando o texto
      child: TextFormField(
        validator: (String? text) {
        
          if (text !=null && text.isEmpty) return hint + ' inválido!';
        },
        obscureText:
            obscure, //variável obscure dirá se o texto é obscuro ou não
        //estilo do texto
        style: TextStyle(
            color: Colors.white, //cor
            fontWeight: FontWeight.w600),
        //decorando o campo
        decoration: InputDecoration(
            icon: Icon(
              icon, //icone do campo será definido pela variável icone
              color: Colors.white, //cor do icone
            ),
            border: InputBorder.none, //sem borda no campo
            hintText: hint, //texto do campo será definido pela variável hint
            //estilo do texto
            hintStyle: const TextStyle(
                color: Colors.white, //cor do texto
                fontSize: 15 //fonte
                ),
            //afastamento nas laterais do campo
            contentPadding:
                const EdgeInsets.only(top: 30, right: 30, bottom: 30, left: 5)),
      ),
    );
  }
}
