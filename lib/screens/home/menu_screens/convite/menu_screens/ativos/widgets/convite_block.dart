import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConviteBloc extends ChangeNotifier{



  Map<String, Map<String, dynamic>> _convites = {};
  late Map<String, dynamic> convites;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List <DocumentSnapshot> _ordes = [];

  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario = FirebaseAuth.instance.currentUser;
  List<String> ids= [];

  ConviteBloc(){
    _addConvitesListener();
    notifyListeners();
  }
  dados(){
    return _convites;
  }
  uid(){
    return ids;
  }
  remover(uid){
    _firestore.collection('/users').doc(usuario!.uid).collection('convites').doc(uid).delete().then((convite) => print("Document deleted"),
      onError: (e) => print("Error updating document $e"),);
    notifyListeners();
  }

  void _addConvitesListener(){
    _firestore.collection('/users').doc(usuario!.uid).collection('convites').snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((change) {
        String uid = change.doc.id;
        switch(change.type){
          case DocumentChangeType.added:
            _convites[uid] = change.doc.data()  as Map<String, dynamic>;
            ids.add(uid);

            break;
          case DocumentChangeType.modified:
            _convites[uid] = change.doc.data()  as Map<String, dynamic>;
            break;
          case DocumentChangeType.removed:
            ids.remove(uid);
            _convites.remove(uid);
            break;

        }
      });

    });
  }
  void subscribes(String uid){

  }


}

