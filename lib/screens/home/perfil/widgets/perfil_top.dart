import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:utopy/screens/login/login_screen.dart';


//topo da home
class PerfilTop extends StatelessWidget {

  final Animation<double> containerGrow;//variável que receberá animação

  //construtor
  const PerfilTop({Key? key, required this.containerGrow}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;//tamanho da tela

    return Container(
      height: screenSize.height * 0.32, //limitando container a 40% do tamanho da tela
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.arrow_back),
                        Text('Voltar')
                      ],
                    )
                ),


                ElevatedButton(
                    onPressed: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> LoginScreen()));
                    },
                    child: Column(
                      children: [
                        Icon(Icons.logout),
                        Text('Sair')
                      ],
                    )
                ),

              ],
            ),

            //texto de boas vindas
            const Text(
              'Perfil',
              style: TextStyle(
                  fontSize: 30,//fonte
                  fontWeight: FontWeight.w400,//peso
                  color: Colors.white//cor
              ),
            ),
            //container para imagem do perfil
            Container(
              alignment: Alignment.topRight,//alinhamento para o filho do container
              width: containerGrow.value * 120, //largura crescendo
              height: containerGrow.value * 120,//altura crescendo
              //decoração
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,//formato circula para a imagem ficar redonda
                  image: DecorationImage(
                      image: AssetImage('images/ceumaperfil.jpg'),
                      fit: BoxFit.cover, //preencher
                      opacity: 1.0 //opacidade
                  )
              ),
              //bolinha de notificação
              child: Container(
                width: containerGrow.value * 35, //largura crescendo
                height: containerGrow.value * 35,//altura crescendo
                margin: EdgeInsets.only(left:80),//margem a esquerda
                alignment: Alignment.center, //alinhamento
                //texto da bolinha
                child: Text(
                  '2',
                  style: TextStyle(
                      fontSize: containerGrow.value * 15,//fonte crescendo
                      fontWeight: FontWeight.w400,//peso
                      color: Colors.white //cor
                  ),
                ),
                //decoração da bolinha
                decoration: BoxDecoration(
                    shape: BoxShape.circle, //formato em circulo
                    color: Colors.lightGreen//cor
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
