import 'package:flutter/material.dart';
import 'package:utopy/screens/login/login_screen.dart';

class DropPage extends StatelessWidget {
  var valorCondo;
  var formCondo;

  DropPage({Key? key, required this.valorCondo, required this.formCondo}) : super(key: key);

  final dropValue = ValueNotifier('');
  final condominios = [
    'Ceuma Renascença',
    'Ceuma Turu',
    'Ceuma Anil',
    'Ceuma Cohama'

  ];


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
           valueListenable: dropValue,
          builder: (BuildContext contex, String value, _){
             return Container(
               margin: const EdgeInsets.only(bottom: 10),
               child: SizedBox(

                 child: Form(
                   key: formCondo,
                   child: DropdownButtonFormField<String>(

                   decoration: InputDecoration(
                     label: const Text('Condominio'),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(6)
                   )

                   ),

                   icon: const Icon(Icons.house_outlined),
                   isExpanded: true,
                   hint: const Text('Escolha o condominio'),
                   value: (value.isEmpty)?null:value,
                   items: condominios
                       .map((op) => DropdownMenuItem(
                          value: op,
                          child: Text(op)
                         ))
                       .toList(),
                   onChanged: (escolha){
                     dropValue.value = escolha.toString();
                     print(escolha);
                     valorCondo = escolha.toString();
                     print(valorCondo);

                   },


                 ),
               ),)
             );
          },

        )


    ;
  }
}
