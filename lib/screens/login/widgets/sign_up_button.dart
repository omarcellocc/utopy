import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {

  var setFormAction;
  String toggleButton;

  SignUpButton({Key? key, required this.toggleButton, required this.setFormAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.only(
         //distancia do botão para o campo
        bottom: 30,
      ),
      onPressed: setFormAction
          /*(){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>SignUpScreen())
        );
      }*/,
      child: Text(
        toggleButton, //texto
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
