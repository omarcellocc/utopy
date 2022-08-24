import 'package:flutter/material.dart';
import 'package:utopy/screens/home/home_screen.dart';
import 'package:utopy/screens/login/login_screen.dart';
import 'package:utopy/services/auth_services.dart';
import 'package:provider/provider.dart';
class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if (auth.isLoading){
      return loading();
    }
    else if (auth.usuario == null){
      return LoginScreen();
    }
    else{
      return HomeScreen();
    }



  }
  loading(){
    return Scaffold(
        body: Center(
          child: CircularProgressIndicator(

          ),
        )

    );
  }
}
