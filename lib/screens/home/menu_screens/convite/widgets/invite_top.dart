import 'package:flutter/material.dart';


//topo da home
class InviteTop extends StatelessWidget {

  final Animation<double> containerGrow;//variável que receberá animação

  //construtor
  const InviteTop({Key? key, required this.containerGrow}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;//tamanho da tela

    return Container(
      height: screenSize.height * 0.2, //limitando container a 40% do tamanho da tela
      //decorando container
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/ceuma.jpg'),//imagem de fundo
              fit: BoxFit.cover,
            opacity: 0.65//preenchendo container
          )
      ),
      //utilizando o safeArea para ignorar a barra de cima da dela
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //espaçamento no eixo vertical
          children: <Widget>[
            //texto de boas vindas
           /* const Text(
              'Utopy',
              style: TextStyle(
                  fontSize: 20,//fonte
                  fontWeight: FontWeight.w900,//peso
                  color: Colors.white//cor
              ),
            ),*/
        Container(
          alignment: Alignment.topRight,//alinhamento para o filho do container
          width: containerGrow.value * 100, //largura crescendo
          height: containerGrow.value * 100,//altura crescendo
          //decoração
          decoration: BoxDecoration(
              //shape: BoxShape.circle,//formato circula para a imagem ficar redonda
              image: DecorationImage(
                  image: AssetImage('images/logo.png'),
                  fit: BoxFit.cover, //preencher
                  opacity: containerGrow.value * 1.0 //opacidade
              )
          ),)

          ],
        ),
      ),
    );
  }
}
