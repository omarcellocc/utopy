import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:utopy/screens/home/widgets/home_top2.dart';
import 'package:utopy/screens/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'auth_services.dart';


class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class DBFirestore{
  DBFirestore._();
  static final DBFirestore _instace = DBFirestore._();
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;

  static FirebaseFirestore get(){
    return DBFirestore._instace._firestore;
  }
}


class HomeAuthService extends StatefulWidget with ChangeNotifier {
   HomeAuthService({Key? key}) : super(key: key);

  @override
  State<HomeAuthService> createState() => _HomeAuthServiceState();
}

class _HomeAuthServiceState extends State<HomeAuthService> {
  String ?nome;

  final FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService(){
    _authCheck();
  }

  _authCheck(){
    _auth.authStateChanges().listen((User? user){
      usuario = (user == null) ? null : user;
      isLoading = false;
    });
  }

  getName() async{
    try{
      String name;
      var condo;
      final docRef = await db.collection('/users').doc(usuario!.uid);
      docRef.get().then(
            (DocumentSnapshot doc) {
          if (doc.data() ==null){
            print('É NULO');
            print(usuario!.uid);
          }else{
            final dados = doc.data() as Map<String, dynamic>;
            condo = dados['condo'];
            print(condo);

            final docRef = db.collection('/Condominios/${condo}/users/').doc(usuario!.uid);
            docRef.get().then(
                  (DocumentSnapshot doc) {
                if (doc.data() ==null){
                  print('É NULO');
                  print(usuario!.uid);
                }else{
                  final dados = doc.data() as Map<String, dynamic>;
                  //print(dados);
                  name = dados['nome'];
                  print(name);
                  setState(()=>
                    nome = name
                    );


                }
              },
              onError: (e) => print("Error getting document: $e"),
            );

          }
        },
        onError: (e) => print("Error getting document: $e"),
      );


    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password'){
        throw AuthException('A senha é muito fraca!');
      }else if(e.code == 'email-already-in-use'){
        throw AuthException('Este email já está cadastrado');
      }
    }
  }
  getNome() async{
    try{
      await context.read().getName();
    } on AuthException catch(e){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    getName();

    return HomeTop(name: nome,);
  }
}


