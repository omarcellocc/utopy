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
        width: 320 * listSlidePosition.value,
        height: 80 * listSlidePosition.value,
        child: Card(
          color: Color.fromARGB(255, 21, 21, 100),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
          ),

            child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /*Container(
                        height: 30.0* listSlidePosition.value,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,//formato circula para a imagem ficar redonda
                            image: DecorationImage(
                              image: AssetImage(image),
                              opacity: 1* listSlidePosition.value
                              //fit: BoxFit.cover
                            )
                        )
                    )*/

                    //SizedBox(height: 10.0* listSlidePosition.value),
                    Padding(padding: EdgeInsets.only(left:5,right: 20),
                    child: Image(image: AssetImage(image))),

                     Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0 * listSlidePosition.value ,

                        ),

                      ),




                  ],
                )
            ),

        ),
      ),
    );
  }
}
