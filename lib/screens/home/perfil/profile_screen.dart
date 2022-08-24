import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:utopy/screens/home/perfil/widgets/perfil_animation.dart';
import 'package:utopy/screens/login/login_screen.dart'; //dilatação temporal




class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  //iniciando animação
  @override
  void initState() {
    super.initState();//iniciando estado
    _controller = AnimationController(
        lowerBound: 0.6,
        upperBound: 1.0,
        vsync: this,
        duration: Duration(seconds: 3)//duração total da animação
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
    //timeDilation= 8;
    return PerfilAnimation(
      controller: _controller,
    );
  }
}
