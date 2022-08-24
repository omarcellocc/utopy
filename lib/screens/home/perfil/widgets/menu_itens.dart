import 'package:flutter/material.dart';


class MenuItens extends StatelessWidget {
  String image;
  String text;
  var action;
  final Animation<double> listSlidePosition;

  MenuItens({Key? key, required this.image, required this.text, required this.action, required this.listSlidePosition}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> action));
      },
      child: SizedBox(
        width: 130 * listSlidePosition.value,
        height: 140 * listSlidePosition.value,
        child: Card(
          color: Color.fromARGB(255, 21, 21, 100),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
          ),
          child: Center(
            child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        height: 60.0* listSlidePosition.value,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,//formato circula para a imagem ficar redonda
                            image: DecorationImage(
                              image: AssetImage(image),
                              opacity: 1* listSlidePosition.value
                              //fit: BoxFit.cover
                            )
                        )
                    )
                    ,
                    SizedBox(height: 10.0* listSlidePosition.value),
                    Center(
                      child: Container(
                        //alignment: Alignment.center,
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0 * listSlidePosition.value ,

                        ),

                      ),)
                    )



                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
