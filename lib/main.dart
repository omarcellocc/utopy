
import 'package:flutter/material.dart';
import 'package:utopy/screens/home/home_screen.dart';
import 'package:utopy/screens/home/menu_screens/convite/menu_screens/ativos/widgets/convite_block.dart';
import 'package:utopy/screens/home/menu_screens/convite/menu_screens/new_invite/new_invite_screen.dart';
import 'package:utopy/screens/home/widgets/home_top.dart';
import 'package:utopy/screens/login/login_screen.dart';
import 'package:utopy/services/auth_services.dart';
import 'package:utopy/widgets/auth_check.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> AuthService()),
          ChangeNotifierProvider(create: (context)=> ConviteBloc())
        ],
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromARGB(255, 21, 10, 150),
         //colorSchemeSeed: Color.fromARGB(0, 6, 51, 111),

          brightness: Brightness.dark
      ),
      home: AuthCheck(),
    );
}}
