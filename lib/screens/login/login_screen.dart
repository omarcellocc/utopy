import 'package:utopy/screens/home/home_screen.dart';
import 'package:utopy/screens/login/recovery.dart';
import 'package:utopy/screens/login/widgets/drop_page.dart';
import 'package:utopy/screens/login/widgets/form_container.dart';
import 'package:utopy/screens/login/widgets/sign_up_button.dart';
import 'package:utopy/screens/login/widgets/stagger_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utopy/screens/login/widgets/drop_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:utopy/services/auth_services.dart';

import 'package:utopy/screens/login/widgets/form_container2.dart';

//a classe LoginScreen erda de StatefulWidget que permite refazer a tela varias vezes
class LoginScreen extends StatefulWidget {

  //construtor
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin // STPSM para utilizar o vsync no initState
{
  final _formNome = GlobalKey<FormState>();
  final _valorNome = TextEditingController();

  final _formSobrenome = GlobalKey<FormState>();
  final _valorSobrenome = TextEditingController();

  final _formCpf = GlobalKey<FormState>();
  final _valorCpf = TextEditingController();

  var _valorCondo;

  final _formEmail = GlobalKey<FormState>();
  final _valorEmail = TextEditingController();

  final _formSenha = GlobalKey<FormState>();
  final _valorSenha = TextEditingController();


  bool loading = false;
  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  late String text;
  late double margem;
  late AnimationController _animationController; //Controlador de animação


  setFormAction(bool acao){
    setState((){
      isLogin = acao;
      if (isLogin){
        titulo = 'UTOPY';
        actionButton = 'ENTRAR';
        toggleButton = 'Não tem uma conta? Cadastre-se';
        margem = 120;

      }else{
        titulo = 'Cadastre-se';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao login';
        margem = 30;
      }
    });
  }

  final dropValue = ValueNotifier('');
  final condominios = [
    'Ceuma Renascença',
    'Ceuma Turu',
    'Ceuma Anil',
    'Ceuma Cohama',
  ];

  login() async{
    setState(()=>loading = true);
    try{
      await context.read<AuthService>().login(_valorEmail.text, _valorSenha.text);
    } on AuthException catch(e){
      setState(()=>loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async{
    setState(()=>loading = true);
    try{
      await context.read<AuthService>().registrar(_valorNome.text, _valorSobrenome.text, _valorCpf.text, _valorCondo,_valorEmail.text, _valorSenha.text);
    } on AuthException catch(e){
      setState(()=>loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }



  //inicializando o Controlador de animação com o initState
  @override
  void initState(){
    super.initState();
    setFormAction(true);
    _animationController= AnimationController(
        vsync: this,
        duration: const Duration(seconds:2),//duração da animação
    );


   //realizando a transição entre a tela de login e a home do perfil
    _animationController.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>HomeScreen())
        );
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Login Realizado',
                style: TextStyle(
                  fontSize: 18
                ),
                ),
                backgroundColor: Colors.lightBlueAccent,
                padding: EdgeInsets.only(bottom: 20, top: 15, left: 15, right: 15),
                )
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
                  children: [
                    //Padding permite manipular a posição dos corpos
                     Padding(
                      padding: EdgeInsets.only(
                          top: margem, //
                          bottom: 10
                      ),
                      child: Text(
                        titulo, //texto
                        textAlign: TextAlign.center, //alinhamento centralizado
                        //estilo do texto
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white, //cor
                            fontSize: 40, //fonte
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, //
                          bottom: 20
                      ),

                      child: Image.asset('images/logo.png',
                        width: 130,//largura
                        height: 130,//altura
                        fit: BoxFit.contain,//tipo de preenchimento

                      ),


                ),


                    isLogin==false
                        ?
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal:20),
                        child:ValueListenableBuilder(
                      valueListenable: dropValue,
                      builder: (BuildContext context, String value, _){
                        return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: SizedBox(
                              width: 360,
                              child: Form(
                                child: DropdownButtonFormField<String>(

                                  decoration: InputDecoration(

                                      label: const Text('Condominio'),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6)
                                      )

                                  ),

                                  icon: const Icon(Icons.house_outlined),
                                  isExpanded: false,
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
                                    _valorCondo = escolha.toString();
                                  },


                                ),
                              ),)
                        );
                      },

                    ))
                    :
                    SizedBox(),



                    isLogin == true?
                    FormContainer(
                        form: _formEmail,
                        valor: _valorEmail,
                        form1: _formSenha,
                        valor1: _valorSenha)
                    :
                    FormContainer2(
                        formNome: _formNome,
                        valorNome: _valorNome,
                        formSobrenome: _formSobrenome,
                        valorSobrenome: _valorSobrenome,
                        formCpf: _formCpf,
                        valorCpf: _valorCpf,
                        formEmail: _formEmail,
                        valorEmail: _valorEmail,
                        formSenha: _formSenha,
                        valorSenha: _valorSenha),
                    //Chamando o Widget FormContainer
                    //Widget do botão

                    Padding(
                      padding: EdgeInsets.only(left: 60, right: 60, top: 30, bottom: 20),
                      child: ElevatedButton(
                        onPressed: (){
                          print('valor:${_valorCondo}');
                          if(isLogin){
                            if (_formEmail.currentState!.validate() && _formSenha.currentState!.validate()){
                              if (isLogin){
                                login();
                              }
                              else{
                                registrar();
                              }
                            }
                          }
                          else{
                            if(_valorCondo==null){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Escolha um condominio!',
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
                            _formSobrenome.currentState!.validate()&&
                                _formCpf.currentState!.validate() &&
                                _formEmail.currentState!.validate() &&
                                _formSenha.currentState!.validate()
                            ){
                              if (isLogin){
                                login();
                              }
                              else{
                                registrar();

                              }

                            }
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
                                    actionButton,
                                    style: TextStyle(
                                        fontSize: 20
                                    )
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SignUpButton(
                      toggleButton: toggleButton,
                      setFormAction: ()=>setFormAction(!isLogin),
                    ),//chamando o WidGet SignUpButton

                  ],

                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}











