import '../constants.dart';
import 'package:bmi_calculator/screens/Input_page.dart';
import 'package:flutter/material.dart';
import '../components/Reusable_card.dart';
import '../components/BottomButton.dart';
class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String TypeText;
  ResultPage({this.bmiResult,this.resultText,this.TypeText});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR'
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                      Text(
                        TypeText,style: kresultTextStyle,
                      ),
                  Text(
                    bmiResult,style: kBMITextStyle,
                  ),
                  Text(
                    'The Normal BMI is between 18.5 and 25',
                    style: kTextstyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    resultText,style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>InputPage()));
            },
            buttonTitle: 'Re-Calculate',
          ),
        ],
      ),
    );
  }
}
