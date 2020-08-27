import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  BottomButton({this.buttonTitle,this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top:20.0),
        padding: EdgeInsets.only(bottom:20.0,top: 10.0),
        width: double.infinity,
        child: Center(child: Text(buttonTitle,style: kLargeButtonStyle,)),
      ),
    );
  }
}