import 'package:utopy/screens/home/menu_screens/convite/widgets/invite_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation; //dilatação temporal



class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  //iniciando animação
  @override
  void initState() {
    super.initState();//iniciando estado
    _controller = AnimationController(
        lowerBound: 0.3,
        upperBound: 1.0,
        vsync: this,
        duration: Duration(seconds: 1)//duração total da animação
    );

    _controller.forward();
  }
  //liberando memória do controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    timeDilation= 1;
    return InviteAnimation(
      controller: _controller,
    );
  }
}
