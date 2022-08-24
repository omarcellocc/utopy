
import 'package:utopy/screens/home/menu_screens/convite/widgets/invite_menu.dart';
import 'package:utopy/screens/home/menu_screens/convite/widgets/invite_top.dart';
import 'package:flutter/material.dart';

class InviteAnimation extends StatelessWidget {

  final controller;
  final Animation<double>containerGrow;
  final Animation<double> listSlidePosition; //animação do slide



  InviteAnimation({required this.controller}) :
        containerGrow = CurvedAnimation(
            parent: controller,//controlador (0.3:1)
            curve: Curves.ease //curva
        ),
        listSlidePosition = CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.0,
                1.0,
                curve:  Curves.ease

            )
        );


  Widget _buildAnimation(BuildContext context, Widget? child){
    return ListView(

      children: [
        InviteTop(
          containerGrow: containerGrow,
        ),
        Container(
          padding: EdgeInsets.only(top:20),
          color: Colors.black,
          alignment: Alignment.center,
          child: Text(
            'Convidar',
            style: TextStyle(
              fontSize: 35,
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        InviteMenu(
          listSlidePosition: listSlidePosition,
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.black,
        body: SafeArea(
            child: AnimatedBuilder(
                animation: controller, //animação controlador
                builder: _buildAnimation //build da tela
            )
        )
    );
  }
}
