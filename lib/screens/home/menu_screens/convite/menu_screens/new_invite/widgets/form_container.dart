import 'package:flutter/services.dart';
import 'package:utopy/screens/login/widgets/drop_page.dart';
import 'package:utopy/widgets/input_form.dart';
import 'package:utopy/screens/login/widgets/input_field.dart';
import 'package:flutter/material.dart';
//classe de formulário, erda de Stateless pois não vamos modificar estado
class FormContainer2 extends StatelessWidget {
  var formNome, valorNome;
  var formCpf, valorCpf;
  var formData, valorData;


  FormContainer2({Key? key,
    required this.formNome,
    required this.valorNome,
    required this.formCpf,
    required this.valorCpf,
    required this.formData,
    required this.valorData,

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
                tipo: 'CPF',
                icone: Icon(Icons.account_box_rounded),
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
                tipo: 'Data',
                icone: Icon(Icons.date_range),
                keyboard: TextInputType.datetime,
                formato: FilteringTextInputFormatter.singleLineFormatter,
                obscuro: false,
                valor: valorData,
                form: formData
            ),


          ],
        ),
      ),
    );
  }
}
