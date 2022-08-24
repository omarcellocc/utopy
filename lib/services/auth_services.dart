import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:utopy/screens/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';


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


class AuthService extends ChangeNotifier{

  final FirebaseFirestore db = FirebaseFirestore.instance;
  late AuthService auth;
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
      notifyListeners();
    });
  }
  _user(){
    usuario = _auth.currentUser;
    notifyListeners();
    return usuario;

  }
  _getUser(){
    usuario = _auth.currentUser;
    notifyListeners();

  }
  registrar(String nome, String sobrenome, String cpf, String condo, String email, String senha) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      String idCondo='';
      switch(condo){
        case 'Ceuma Renascença':
          idCondo = '01.778.130/0001-48';
          break;
        case 'Ceuma Turu':
          idCondo = '02.778.130/0001-48';
          break;
        case 'Ceuma Anil':
          idCondo = '03.778.130/0001-48';
          break;
        case 'Ceuma Cohama':
          idCondo = '04.778.130/0001-48';
          break;
      }
      await db.collection('/Condominios/${idCondo}/users')
            .doc(usuario!.uid)
            .set({
              'uid': usuario!.uid,
        });
      await db.collection('/users')
          .doc(usuario!.uid)
          .set({
        'email': email,
        'condo': condo,
        'idCondo': idCondo,
        'cpf': cpf,
        'sobrenome': sobrenome,
        'nome': nome,
      });
      _getUser();

    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password'){
        throw AuthException('A senha é muito fraca!');
      }else if(e.code == 'email-already-in-use'){
        throw AuthException('Este email já está cadastrado');
      }
    }
  }

  login(String email, String senha) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found'){
        throw AuthException('Email não encontrado. Cadastre-se!');
      }else if(e.code == 'wrong-password'){
        throw AuthException('Senha incorreta. Tente novamente!');
      }
    }
  }

  logout()async{
    await _auth.signOut();
    _getUser();
  }

  gerarConvite(String nome, String cpf, String tipo, String data) async{
    try{
      var idCondo;
      final docRef = await db.collection('/users').doc(usuario!.uid);
      docRef.get().then(
            (DocumentSnapshot doc) {
              if (doc.data() ==null){
                print('É NULO');
                print(usuario!.uid);
              }else{
                final dados = doc.data() as Map<String, dynamic>;
                print(dados);
                idCondo = dados['idCondo'];
                print(idCondo);
                db.collection('/convites')
                    .doc('convite${data}')
                    .set({
                  'nome': nome,
                  'cpf': cpf,
                  'tipo': tipo,
                  'data': data
                });
                db.collection('/users/${usuario!.uid}/convites/')
                    .doc('convite${data}');
              }
        },
        onError: (e) => print("Error getting document: $e"),
      );
      _getUser();


    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password'){
        throw AuthException('A senha é muito fraca!');
      }else if(e.code == 'email-already-in-use'){
        throw AuthException('Este email já está cadastrado');
      }
    }
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
                  return name;

                }
              },
              onError: (e) => print("Error getting document: $e"),
            );

          }
        },
        onError: (e) => print("Error getting document: $e"),
      );
      _getUser();


    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password'){
        throw AuthException('A senha é muito fraca!');
      }else if(e.code == 'email-already-in-use'){
        throw AuthException('Este email já está cadastrado');
      }
    }
  }


}





