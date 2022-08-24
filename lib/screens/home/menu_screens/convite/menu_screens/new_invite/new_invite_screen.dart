

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:provider/provider.dart';
import 'package:utopy/services/auth_services.dart';

import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:utopy/screens/home/menu_screens/convite/menu_screens/new_invite/widgets/form_container.dart';
import 'package:utopy/screens/home/menu_screens/convite/menu_screens/new_invite/widgets/sign_up_button.dart';
import 'package:utopy/screens/home/widgets/stagger_animation.dart';
import 'package:utopy/screens/login/widgets/form_container.dart';

//a classe LoginScreen erda de StatefulWidget que permite refazer a tela varias vezes
class NewInviteScreen extends StatefulWidget {

  //construtor
  const NewInviteScreen({Key? key}) : super(key: key);

  @override
  State<NewInviteScreen> createState() => _NewInviteScreenState();
}

class _NewInviteScreenState extends State<NewInviteScreen> with SingleTickerProviderStateMixin // STPSM para utilizar o vsync no initState
    {

  final _formNome = GlobalKey<FormState>();
  final _valorNome = TextEditingController();

  final _formCpf = GlobalKey<FormState>();
  final _valorCpf = TextEditingController();

  var _valorTipo;

  final _formData = GlobalKey<FormState>();
  final _valorData = TextEditingController();

  final dropValue = ValueNotifier('');
  final tipo = [
    'Convidado',
    'Visitante',
    'Prestador de serviços',
  ];

  bool loading = false;
  var icon = Icons.add;


  late AnimationController _animationController; //Controlador de animação


  gerarConvite()async{
    try{
      setState(()=>loading = true);

      await context.read<AuthService>().gerarConvite(_valorNome.text, _valorCpf.text, _valorTipo,_valorData.text);
    } on AuthException catch(e){
      setState(()=>loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Convite Criado',
            style: TextStyle(
                fontSize: 18
            ),
          ),
          backgroundColor: Colors.lightBlueAccent,
          padding: EdgeInsets.only(bottom: 20, top: 15, left: 15, right: 15),
        )
    );
  }


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

        Navigator.pop(context);
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
                        "Criar Convite", //texto
                        textAlign: TextAlign.center, //alinhamento centralizado
                        //estilo do texto
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white, //cor
                            fontSize: 30, //fonte
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
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal:20),
                        child:ValueListenableBuilder(
                          valueListenable: dropValue,
                          builder: (BuildContext contex, String value, _){
                            return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: SizedBox(

                                  child: Form(
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                          label: const Text('Tipo'),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6)
                                          )

                                      ),

                                      icon: Icon(icon),
                                      isExpanded: true,
                                      hint: const Text('Escolha o Tipo'),
                                      value: (value.isEmpty)?null:value,
                                      items: tipo
                                          .map((op) => DropdownMenuItem(
                                          value: op,
                                          child: Text(op)
                                      ))
                                          .toList(),
                                      onChanged: (escolha){
                                        dropValue.value = escolha.toString();
                                        _valorTipo = escolha.toString();
                                        if (_valorTipo==tipo[0]){
                                          icon= Icons.people;
                                        }
                                        else if (_valorTipo==tipo[1]){
                                          icon= Icons.house_outlined;
                                        }
                                        else if (_valorTipo==tipo[2]){
                                          icon = Icons.home_repair_service;
                                        }
                                      },



                                    ),
                                  ),)
                            );
                          },

                        ))
                    ,
                    FormContainer2(
                        formNome: _formNome,
                        valorNome: _valorNome,
                        formCpf: _formCpf,
                        valorCpf: _valorCpf,
                        formData: _formData,
                        valorData: _valorData),
                    SignUpButton()//chamando o WidGet SignUpButton
                  ],

                ),
                //Widget do botão

                Padding(
                  padding: EdgeInsets.only(left: 60, right: 60, top:20, bottom: 60),
                  child: ElevatedButton(
                    onPressed: (){
                      print('valor:${_valorTipo}');
                      if(_valorTipo==null){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Selecione um tipo!',
                                style: TextStyle(
                                    fontSize: 18
                                ),
                              ),
                              backgroundColor: Colors.deepOrange,
                              padding: EdgeInsets.only(bottom: 20, top: 15, left: 15, right: 15),
                            )
                        );
                      }
                        else if (_formNome.currentState!.validate() &&
                            _formCpf.currentState!.validate() &&
                            _formData.currentState!.validate()
                            ){

                            gerarConvite();
                             Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Convite gerado!',
                                    style: TextStyle(
                                        fontSize: 18
                                    ),
                                  ),
                                  backgroundColor: Colors.green,
                                  padding: EdgeInsets.only(bottom: 20, top: 15, left: 15, right: 15),
                                )
                            );
                        }


                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (loading)
                          ?[
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]
                          :
                      [
                        Icon(Icons.check),
                        Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                                'Gerar Convite',
                                style: TextStyle(
                                    fontSize: 20
                                )
                            )
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
