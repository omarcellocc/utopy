
import 'dart:ffi';

import 'package:utopy/aguarde.dart';
import 'package:flutter/material.dart';
import 'package:utopy/screens/home/menu_screens/convite/invit_screen.dart';
import 'package:utopy/screens/home/widgets/menu_itens.dart';


class Menu extends StatelessWidget {

  final Animation<double> listSlidePosition;

  Menu({Key? key, required this.listSlidePosition}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            MenuItens(
              image: 'images/invite.png',
              text: 'Convidar',
              action: InviteScreen(),
              listSlidePosition: listSlidePosition,
              ),
            MenuItens(
                image: 'images/avisos.png',
                text: 'Avisos',
                action: AguardeScreen(),
                listSlidePosition: listSlidePosition,
            ),
            MenuItens(
                image: 'images/car.png',
                text: '   Liberar\nMotorista',
                action: AguardeScreen(),
                listSlidePosition: listSlidePosition,
            ),
            MenuItens(
                image: 'images/food.png',
                text: 'Liberar\nDelivery',
                action: AguardeScreen(),
                listSlidePosition: listSlidePosition,
            ),
            MenuItens(
                image: 'images/futsal.png',
                text: 'Ginásio',
                action: AguardeScreen(),
                listSlidePosition: listSlidePosition,
            ),
            MenuItens(
                image: 'images/academia.png',
                text: 'Academia',
                action: AguardeScreen(),
                listSlidePosition: listSlidePosition,
            ),
            MenuItens(
                image: 'images/eventos.png',
                text: 'Eventos',
                action: AguardeScreen(),
                listSlidePosition: listSlidePosition,
            ),
            MenuItens(
                image: 'images/piscina.png',
                text: 'Piscina',
                action: AguardeScreen(),
              listSlidePosition: listSlidePosition,
            ),
          ],
        ),
      ),
    );
    
  }
}
