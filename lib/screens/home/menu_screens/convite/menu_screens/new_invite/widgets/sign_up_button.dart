import 'package:utopy/screens/home/home_screen.dart';
import 'package:utopy/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {

  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.only(
        top: 150 //distancia do botão para o campo
      ),
      onPressed: (){
        Navigator.pop(context);
      },
      child: const Text(
        "Voltar!", //texto
        textAlign: TextAlign.center, //alinhamento centralizado
        //estilo do texto
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w500, //peso do texto
          color: Colors.white, //cor
          fontSize: 15, //fonte
          letterSpacing: 0.5 //espaçamento

      ),
      ),

    );
  }
}
