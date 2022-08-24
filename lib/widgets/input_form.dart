import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utopy/validator/form_validator.dart';





class InputForm extends StatelessWidget {
  String tipo;
  var icone;
  var keyboard;
  var formato;
  bool obscuro;
  var form;
  var valor;



  InputForm({
    Key? key,
    required this.tipo,
    required this.icone,
    required this.keyboard,
    required this.formato,
    required this.obscuro,
    required this.valor,
    required this.form

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
        child:Form(
      key: form,
      child: TextFormField(
        controller: valor,
        style: TextStyle(
            fontSize: 15
        ),
        decoration: InputDecoration(

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6)
          ),
          labelText: tipo,
          prefixIcon: icone,

        ),
        keyboardType: keyboard,
        inputFormatters: [formato],
        validator: (value){
          if (value!.isEmpty){
            if (tipo.toLowerCase()=='senha'){
              return 'Informe a '+tipo;

            }
            return 'Informe o '+tipo;
          }
          else if (tipo.toLowerCase() == 'senha' && value.length <6){
            return 'Sua senha deve ter no minimo 6 caracteres';
          }
          else if (tipo.toLowerCase() == 'e-mail' && isMail(value)==false){
            return 'E-mail inválido';
          }
          else if (tipo.toLowerCase() == 'cpf' && isCPF(value)==false){
            return 'CPF inválido';
          }

          return null;
        },
        onChanged: (value){
          valor= value;
        },
        obscureText: obscuro,
      ),
    ));
  }
}
