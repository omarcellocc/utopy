import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utopy/screens/home/menu_screens/convite/menu_screens/ativos/widgets/convite_block.dart';
import 'package:utopy/screens/home/menu_screens/convite/menu_screens/ativos/widgets/convite_tile.dart';

class ConvitesTab extends StatelessWidget {
  late ConviteBloc convites;

  @override
  Widget build(BuildContext context) {
    convites = context.watch<ConviteBloc>();
    Map<String, Map<String, dynamic>> data = convites.dados();
    List<String> uid = convites.ids;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Color.fromARGB(255, 21, 10, 150),
          //colorSchemeSeed: Color.fromARGB(0, 6, 51, 111),

          brightness: Brightness.dark
      ),
      home: Scaffold(
        body: Column(
          children:<Widget> [
            SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: 'Pesquisar',
                          hintStyle: TextStyle(
                              color: Colors.white
                          ),
                          icon: Icon(Icons.search, color: Colors.white),
                          border: InputBorder.none

                      )
                  ),
                ) ),
            Expanded(

                child:
                data== null
                    ?
                    Center(
                      child: Text(
                        'Nenhum convite ativo'
                      ),
                    )
                    :
                    ListView.separated(
                      itemBuilder: (context, index){
                        return ConviteTile(dados: data[uid[index]]);
                      },
                      separatorBuilder: (context, index){
                        return Divider();
                      },
                      itemCount: data.length,
                    )
            )


          ],

        ) ,
      )

    );
  }
}
