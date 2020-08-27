import 'package:flutter/material.dart';
import '../constants.dart';

class MaleFemale extends StatelessWidget {

  final IconData icn;
  final String txt;

  @override
  MaleFemale(this.icn,this.txt);
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icn,size: 80.0,
        ),
        SizedBox(height: 15.0,),
        Text(
          txt,style: kTextstyle,
        ),
      ],
    );
  }
}