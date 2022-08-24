import 'package:flutter/services.dart';
import 'package:utopy/screens/login/widgets/drop_page.dart';
import 'package:utopy/widgets/input_form.dart';
import 'package:utopy/screens/login/widgets/input_field.dart';
import 'package:flutter/material.dart';
//classe de formulário, erda de Stateless pois não vamos modificar estado
class FormContainer2 extends StatelessWidget {
  var formNome, valorNome;
  var formSobrenome, valorSobrenome;
  var formCpf, valorCpf;
  var formEmail, valorEmail;
  var formSenha, valorSenha;



  FormContainer2({Key? key,
    required this.formNome,
    required this.valorNome,
    required this.formSobrenome,
    required this.valorSobrenome,
    required this.formCpf,
    required this.valorCpf,
    required this.formEmail,
    required this.valorEmail,
    required this.formSenha,
    required this.valorSenha,

  }
  ) : super(key: key);

  final dropValue = ValueNotifier('');
  final condominios = [
    'Ceuma Renascença',
    'Ceuma Turu',
    'Ceuma Anil',
    'Ceuma Cohama'

  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:20),//margem simétrica (centralizada na horizontal)
      //filho do tipo formulário
      child: Form(
        child: Column(
          children:  <Widget>[
            //chamando o widget InputField para criar o campo usuário
            InputForm(
                tipo: 'Nome',
                icone: Icon(Icons.person),
                keyboard: TextInputType.name,
                formato: FilteringTextInputFormatter.singleLineFormatter,
                obscuro: false,
                valor: valorNome,
                form: formNome
            ),
            InputForm(
                tipo: 'Sobrenome',
                icone: Icon(Icons.person),
                keyboard: TextInputType.name,
                formato: FilteringTextInputFormatter.singleLineFormatter,
                obscuro: false,
                valor: valorSobrenome,
                form: formSobrenome
            ),
            InputForm(
                tipo: 'CPF',
                icone: Icon(Icons.person),
                keyboard: TextInputType.number,
                formato: FilteringTextInputFormatter.digitsOnly,
                obscuro: false,
                valor: valorCpf,
                form: formCpf
            ),
            /*InputForm(
                tipo: 'Condominio',
                icone: Icon(Icons.house_outlined),
                keyboard: TextInputType.emailAddress,
                formato: FilteringTextInputFormatter.singleLineFormatter,
                obscuro: false,
                valor: valorCondo,
                form: formCondo
            ),*/
            InputForm(
                tipo: 'E-mail',
                icone: Icon(Icons.mail_rounded),
                keyboard: TextInputType.emailAddress,
                formato: FilteringTextInputFormatter.singleLineFormatter,
                obscuro: false,
                valor: valorEmail,
                form: formEmail
            ),
            InputForm(
                tipo: 'Senha',
                icone: Icon(Icons.padding_rounded),
                keyboard: TextInputType.name,
                formato: FilteringTextInputFormatter.singleLineFormatter,
                obscuro: true,
                valor: valorSenha,
                form: formSenha
            ),
          ],
        ),
      ),
    );
  }
}
