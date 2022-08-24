
import 'dart:ffi';

import 'package:utopy/aguarde.dart';
import 'package:utopy/screens/home/menu_screens/convite/menu_screens/ativos/ativos_screen.dart';
import 'package:utopy/screens/home/menu_screens/convite/menu_screens/new_invite/new_invite_screen.dart';
import 'package:utopy/screens/home/menu_screens/convite/widgets/invite_menu_itens.dart';
import 'package:flutter/material.dart';
import 'package:utopy/screens/home/menu_screens/convite/invit_screen.dart';


class InviteMenu extends StatelessWidget {

  final Animation<double> listSlidePosition;

  InviteMenu({Key? key, required this.listSlidePosition}) : super(key: key);

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
              image: 'images/novo.png',
              text: 'Novo Convite',
              action: NewInviteScreen(),
              listSlidePosition: listSlidePosition,
            ),
            MenuItens(
              image: 'images/ativo.png',
              text: 'Convites Ativos',
              action: ConvitesTab(),
              listSlidePosition: listSlidePosition,
            ),
            MenuItens(
              image: 'images/historico.png',
              text: 'Histórico',
              action: AguardeScreen(),
              listSlidePosition: listSlidePosition,
            ),

          ],
        ),
      ),
    );

  }
}
