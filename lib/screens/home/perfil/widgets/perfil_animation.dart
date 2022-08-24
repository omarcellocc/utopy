import 'package:utopy/screens/home/perfil/widgets/perfil_top.dart';
import 'package:utopy/screens/home/perfil/widgets/tema.dart';
import 'package:utopy/screens/home/widgets/home_top.dart';
import 'package:utopy/screens/home/widgets/logOut.dart';
import 'package:utopy/screens/home/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:utopy/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


class PerfilAnimation extends StatelessWidget {

  final controller;
  final Animation<double>containerGrow;
  final Animation<double> listSlidePosition; //animação do slide



  PerfilAnimation({required this.controller}) :
        containerGrow = CurvedAnimation(
            parent: controller,//controlador (0:1)
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
            PerfilTop(
              containerGrow: containerGrow,
            ),


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
