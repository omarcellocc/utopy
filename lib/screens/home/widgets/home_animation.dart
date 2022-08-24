import 'package:utopy/screens/home/widgets/home_top.dart';
import 'package:utopy/screens/home/widgets/logOut.dart';
import 'package:utopy/screens/home/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:utopy/screens/home/widgets/tema.dart';
import 'package:utopy/services/auth_services2.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomeAnimation extends StatelessWidget {

  final controller;
  final Animation<double>containerGrow;
  final Animation<double> listSlidePosition; //animação do slide



  HomeAnimation({required this.controller}) :
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
            HomeTop(containerGrow: containerGrow),
            SizedBox(
              height: 30,
            ),
            Menu(
              listSlidePosition: listSlidePosition,
            ),
            LogOut()
          ],
        );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.black54,
        body: SafeArea(
        child: AnimatedBuilder(
        animation: controller, //animação controlador
        builder: _buildAnimation //build da tela
        )
    )
    );
  }
}
