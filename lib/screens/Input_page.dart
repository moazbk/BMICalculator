import 'file:///E:/Apps/bmi-calculator-flutter/lib/screens/ResultPage.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Icon_content.dart';
import '../components/Reusable_card.dart';
import '../constants.dart';
import '../components/BottomButton.dart';
import '../components/IconWidget.dart';

//Card Type Enum to choose which type of card you selected
enum CardGender{Male,Female}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  CardGender selectgender;
  int height=180;
  int weight=60;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(
                child:
                  ReusableCard(
                    colour: selectgender==CardGender.Male?kActiveColor:kInactiveCardColor,
                    cardChild:MaleFemale(FontAwesomeIcons.mars,'MALE'),
                    onPress: ()
                    {
                      setState(() {
                        selectgender=CardGender.Male;
                      });
                    },
                  ),
              ),
              Expanded(
                  child: ReusableCard(
                    colour:  selectgender==CardGender.Female?kActiveColor:kInactiveCardColor,
                    cardChild: MaleFemale(
                      FontAwesomeIcons.venus,
                      'FEMALE',
                    ),
                    onPress: ()
                    {
                      setState(() {
                        selectgender=CardGender.Female;
                      });
                    },
                  )
              ),
            ],
          ),),
          Expanded(
              child:ReusableCard(
                colour:  kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                     'HEIGHT',
                      style: kTextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style:kHeightstyle,
                        ),
                        Text('cm',style: kTextstyle,),
                      ],
                    ),
                    SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x30EB1555),
                        thumbColor: Color(0xFFEB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height=newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child:ReusableCard(
                      colour:  kActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',style: kTextstyle,),
                          Text(weight.toString(),style: kHeightstyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                            children:<Widget>[
                              RoundIconButton(
                                child: FontAwesomeIcons.minus,
                                press: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                child: FontAwesomeIcons.plus,
                                press: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ]
                          ),
                        ],
                      ),
                    )
               ),
                Expanded(
                    child:ReusableCard(
                      colour:  kActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE',style: kTextstyle,),
                          Text(age.toString(),style: kHeightstyle,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children:<Widget>[
                                RoundIconButton(
                                  child: FontAwesomeIcons.minus,
                                  press: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0,),
                                RoundIconButton(
                                  child: FontAwesomeIcons.plus,
                                  press: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ]
                          ),
                        ],
                      ),
                    )
               ),
              ],
            ),
          ),
          BottomButton(onTap: ()
          {
            setState(() {
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>ResultPage(bmiResult: calc.calculateBMI(),resultText: calc.getResult(),TypeText: calc.TypeText(),)));
            });

          },
            buttonTitle:'CALCULATE',
          ),
        ]
      )
    );
  }
}







