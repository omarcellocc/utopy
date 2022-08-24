import 'package:flutter/services.dart';
import 'package:utopy/button_text.dart';
import 'package:utopy/widgets/input_form.dart';
import 'package:utopy/screens/login/recovery.dart';
import 'package:utopy/screens/login/widgets/input_field.dart';
import 'package:utopy/screens/login/widgets/sign_up_button.dart';
import 'package:flutter/material.dart';

//classe de formulário, erda de Stateless pois não vamos modificar estado
class FormContainer extends StatelessWidget {
  var form;
  var valor;
  var form1;
  var valor1;

  FormContainer({Key? key, required this.form, required this.valor, required this.form1, required this.valor1,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20), //margem simétrica (centralizada na horizontal)
      //filho do tipo formulário
      child: Form(
        child: Column(
          children: [
            //chamando o widget InputField para criar o campo usuário
            InputForm(
                tipo: 'Email',
                icone: Icon(Icons.person),
                keyboard: TextInputType.emailAddress,
                formato: FilteringTextInputFormatter.singleLineFormatter,
                obscuro: false,
                valor: valor,
                form: form
            ),
            InputForm(
                tipo: 'Senha',
                icone: Icon(Icons.password_outlined),
                keyboard: TextInputType.number,
                formato: FilteringTextInputFormatter.digitsOnly,
                obscuro: true,
                valor: valor1,
                form: form1
            ),
            /*
            FlatButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Recovery()));
              },
              child: Text(
                '\n Esqueceu a senha?', //texto
                textAlign: TextAlign.right, //alinhamento centralizado
                //estilo do texto
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500, //peso do texto
                    color: Colors.white, //cor
                    fontSize: 18, //fonte
                    letterSpacing: 0.5 //espaçamento

                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
