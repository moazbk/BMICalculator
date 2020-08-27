import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData child;
  final Function press;
  RoundIconButton({@required this.child,Function this.press});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:press,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 10.0,
      shape: CircleBorder(),
      child: Icon(child),
      fillColor:Color(0xFF4C4F5E) ,
    );
  }
}