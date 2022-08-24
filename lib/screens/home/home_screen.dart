import 'package:provider/provider.dart';
import 'package:utopy/screens/home/widgets/home_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:utopy/screens/login/login_screen.dart'; //dilatação temporal
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utopy/services/auth_services.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;



  //iniciando animação
  @override
  void initState() {
    super.initState();//iniciando estado
    _controller = AnimationController(
        lowerBound: 0.7,
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
    return HomeAnimation(
      controller: _controller,

    );
  }
}
