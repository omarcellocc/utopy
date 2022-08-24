import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {

  final controller;//variável que receberá o controlador

  StaggerAnimation({Key? key, this.controller}): //construtor da classe (recebe o controlador)

  // inicializando animações
   buttonSqueeze = Tween(
    begin: 320.0,//tamanho que inicia
    end: 60.0//tamanho que finaliza
  ).animate(
    CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.20)//intervalo em que essa animação ocorrerá
    )
  ),
  buttonZoomOut = Tween(
    begin: 60.0, //tamanho em que inicia
    end: 1000.0,//tamanho que finaliza
  ).animate(
    CurvedAnimation(
        parent: controller,
        curve: const Interval(
            0.5, 1, //intervalo da animação
            curve: Curves.bounceOut//curva
        )
    )
  ), super(key: key);

  final Animation<double> buttonSqueeze; //animação para encolher largura do botão
  final Animation<double> buttonZoomOut; //animação para expandir botão

  //Widget que irá animar o botão de login
  Widget _buildAnimation(BuildContext context, Widget? child){
      return Padding(
          padding: const EdgeInsets.only(bottom: 50),//posicionando o botão
          //InkWell que será um botão clicável
          child: InkWell(
            onTap: (){
              controller.forward();//acão a ser feita caso seja clicado

            },
            child: Hero(
              tag: 'fade',
              child: //operador térnario
              buttonZoomOut.value == 60?
              Container(
                  width: buttonSqueeze.value, //largura
                  height: 60,//altura
                  alignment: Alignment.center,//alinhamento centralizado
                  child: _buildInside(context),//informações de dentro do botão
                  //decoração do botão
                  decoration: const BoxDecoration(
                      color: const Color.fromRGBO(30, 120, 160, 1.0),//cor
                      borderRadius: BorderRadius.all(Radius.circular(30.0))//borda oval
                  )
              )
                  :
              Container(
                width: buttonZoomOut.value, //largura
                height: buttonZoomOut.value,//altura

                //decoração
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(30, 120, 160, 1.0),//cor
                    //corpo que muda sua borda de cirular para retangular durante a animação
                    shape: buttonZoomOut.value <700 ? BoxShape.circle: BoxShape.rectangle

                ),
              ),
            )
            ),
          );
  }
  //Widget com as informações de dentro do botão de login
  Widget _buildInside(BuildContext context) {
    //se o valor da largura for maior que 75 será retornado o texto
    if (buttonSqueeze.value > 200) {
      return const Text(
          "NOVO CONVITE",
          style: TextStyle(
              color: Colors.white, //cor
              fontSize: 25,//fonte
              fontWeight: FontWeight.w400, //peso
              letterSpacing: 1.0 //espaçamento
          )
      );
    }
    //senão será retornado um indicador de progresso circular
    else{
      return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),//cor
          strokeWidth: 1.0,//largura da linha do indicador
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }
}
