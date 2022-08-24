import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  var funcao;
  ButtonText({Key? key, required this.funcao}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top:24),
      child: ElevatedButton(
        onPressed: (){
          funcao;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check),
            Padding(padding: EdgeInsets.all(16),
            child: Text(
              'Clicar',
              style: TextStyle(
                fontSize: 20
              ),
            )
            )
          ],
        ),
      ),

    );
  }
}
