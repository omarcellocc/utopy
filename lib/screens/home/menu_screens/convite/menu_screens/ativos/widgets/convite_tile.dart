import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'convite_block.dart';

class ConviteTile extends StatelessWidget {
  final Map<String, dynamic>? dados;
  ConviteTile({Key? key, required this.dados}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        dados!['nome'],
        style: TextStyle(
          color: Colors.white
        ),
      ),
      subtitle: Text(
        dados!['tipo'],
        style: TextStyle(
          color: Colors.white
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
              onTap: (){

              },
              child: Icon(Icons.edit)
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: (){
            },
            child: Icon(Icons.delete)
          ),

        ],
      ),
    );
  }
}
