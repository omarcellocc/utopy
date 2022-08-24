import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: ElevatedButton(
        onPressed: ()=> FirebaseAuth.instance.signOut(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Icon(Icons.logout),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    'Sair da conta',
                    style: TextStyle(
                        fontSize: 15
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
