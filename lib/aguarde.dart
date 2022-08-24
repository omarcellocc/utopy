import 'package:flutter/material.dart';

class AguardeScreen extends StatelessWidget {

  AguardeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/picapau.png')
            )
        ),

      ),
    );
  }
}
