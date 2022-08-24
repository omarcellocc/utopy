import 'package:flutter/material.dart';

class Tema extends StatelessWidget {
  const Tema({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:20),
      color: Colors.black,
      alignment: Alignment.center,
      child: Text(
        'Menu de Opções',
        style: TextStyle(
          fontSize: 25,
          color: Colors.lightBlueAccent,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
