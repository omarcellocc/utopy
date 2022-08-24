import 'package:utopy/screens/home/home_screen.dart';
import 'package:utopy/screens/home/menu_screens/convite/menu_screens/new_invite/widgets/sign_up_button.dart';
import 'package:utopy/screens/login/login_screen.dart';
import 'package:utopy/screens/login/widgets/input_field.dart';
import 'package:utopy/screens/login/widgets/recovery_animation.dart';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

//a classe LoginScreen erda de StatefulWidget que permite refazer a tela varias vezes
class Recovery extends StatefulWidget {

  //construtor
  const Recovery({Key? key}) : super(key: key);

  @override
  State<Recovery> createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> with SingleTickerProviderStateMixin // STPSM para utilizar o vsync no initState
    {

  late AnimationController _animationController; //Controlador de animação

  //inicializando o Controlador de animação com o initState
  @override
  void initState(){
    super.initState();
    _animationController= AnimationController(
      vsync: this,
      duration: const Duration(seconds:2),//duração da animação
    );


    //realizando a transição entre a tela de login e a home do perfil
    _animationController.addStatusListener((status) {
      if(status==AnimationStatus.completed){

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context)=>LoginScreen())
        );
      }
    });
  }


  //liberando memória do controlador com o dispose
  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation= 1;//dilatação temporal

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          //imagem de fundo
            image: DecorationImage(
              image: AssetImage('images/fundoLS.gif'),
              fit: BoxFit.cover,//preencher toda a tela

            )
        ),
        //conteudo do tipo ListView que permite digitar nos campos quando o teclado cubra o conteudo
        child: ListView(

          padding: EdgeInsets.zero,//lista sem bordas (padrão 8)
          children: <Widget>[

            //Stack permite adicionar corpos em cima de outros, ideal para animações
            Stack(
              alignment: Alignment.bottomCenter, //alinhado os componentes do container na parte de baixo
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, //
                          bottom: 5
                      ),

                      child: Image.asset('images/logo.png',
                        width: 130,//largura
                        height: 130,//altura
                        fit: BoxFit.contain,//tipo de preenchimento

                      ),


                    ),
                    //Padding permite manipular a posição dos corpos
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 5, //
                          bottom: 10
                      ),
                      child: Text(
                        "RECUPERAR SENHA", //texto
                        textAlign: TextAlign.center, //alinhamento centralizado
                        //estilo do texto
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white, //cor
                            fontSize: 25, //fonte
                            letterSpacing: 1.0, //espaçamento
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ]
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20

                      ), 
                      child: InputField(hint: 'email', obscure: false, icon: Icons.mail) 
                    ),
                    SignUpButton()//chamando o WidGet SignUpButton
                  ],

                ),
                //Widget do botão
                RecoveryAnimation(
                    controller: _animationController.view,
                    text: 'Enviar código', //passando a animação (0:1) como parametro
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
