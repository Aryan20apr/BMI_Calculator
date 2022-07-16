import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/icon_content.dart';
import '../components/constants.dart';

import '../components/calculate_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/components/calculator_brain.dart';

/*const double bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFFD9FFE5);
const bottomContainerColor = Color(0xFFFF4A33);*/

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender?
      selectedGender; //Make this nullable as by default no gender is selected.
  int height = 180;
  int weight = 40;
  int age = 16;
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  // void updateColor(Gender selectedGender) {
  //   print(selectedGender);
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor=inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   } else if(selectedGender==Gender.female){
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor=inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }Replaced by ternary operator
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      /*body: Container(
          //color: const Color(0xFF1D1E33),//Actually a Shorthand for Color property of box Decoration show that we don't need to write box decoration for general containers
          height: 200.0,
          width: 170.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: const Color(0xFF1D1E33),//If we are using box decoration, color property need to be specified here instead of above
            borderRadius: BorderRadius.circular(10.0)//This is used to give circular shape to the edges of the container
          ),
        ),*/ //Reason for not using this specified in document.
      /*  floatingActionButton: Theme(
        data: ThemeData(accentColor: Color(0xFFEB1555)),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      )*/ //Not needed in this project
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    //Passing a function as a value of onPress property
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  //colour: maleCardColor,
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                ),
              ),
              Expanded(
                /*child: Container(
                //color: const Color(0xFF1D1E33),//Actually a Shorthand for Color property of box Decoration show that we don't need to write box decoration for general containers

                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: const Color(
                        0xFF1D1E33), //If we are using box decoration, color property need to be specified here instead of above
                    borderRadius: BorderRadius.circular(
                        10.0) //This is used to give circular shape to the edges of the container
                    ),
              )*/
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  //colour:femaleCardColor,
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "Female",
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            /* child: Container(
            //color: const Color(0xFF1D1E33),//Actually a Shorthand for Color property of box Decoration show that we don't need to write box decoration for general containers

            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: const Color(
                    0xFF1D1E33), //If we are using box decoration, color property need to be specified here instead of above
                borderRadius: BorderRadius.circular(
                    10.0) //This is used to give circular shape to the edges of the container
                ),
          )*/ //Replaced with ReusableCard
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline
                        .alphabetic, //Used so that above property works
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kDigitTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFFEB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: const Color(0xFFFF4A33),
                        overlayColor: const Color(0x29EB1555)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: const Color(0xFFEB1555),
                        inactiveColor: const Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  /*child: Container(
                //color: const Color(0xFF1D1E33),//Actually a Shorthand for Color property of box Decoration show that we don't need to write box decoration for general containers

                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: const Color(
                        0xFF1D1E33), //If we are using box decoration, color property need to be specified here instead of above
                    borderRadius: BorderRadius.circular(
                        10.0) //This is used to give circular shape to the edges of the container
                    ),
              )*/
                  child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kDigitTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                childIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (weight > 30) weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                childIcon: FontAwesomeIcons.plus,
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  /*child: Container(
                //color: const Color(0xFF1D1E33),//Actually a Shorthand for Color property of box Decoration show that we don't need to write box decoration for general containers

                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: const Color(
                        0xFF1D1E33), //If we are using box decoration, color property need to be specified here instead of above
                    borderRadius: BorderRadius.circular(
                        10.0) //This is used to give circular shape to the edges of the container
                    ),
              )*/
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kDigitTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                childIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (age - 1 > 15) age--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                childIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    if (age < 120) age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'Calculate BMI',
          onTap: (){
            CalculatorBrain calc=CalculatorBrain(height:height,weight: weight);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculatedBMI(),
                  resultText: calc.getResults(),
                  interpretation: calc.getInterpretation(),
                 // selectedGender: selectedGender.toString(),
                )));
          },),
        ],
      ),
    );
  }
}

/*class Calc_Recal_Button extends StatelessWidget {
  const Calc_Recal_Button({
    Key? key, required this.onTap, required this.buttonTitle,
  }) : super(key: key);
  final void Function() onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,*//*() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResultsPage()));
      }*//*
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.all(10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child:  Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}*///Moved to separate file

/*
class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {Key? key, required this.childIcon, required this.onPressed})
      : super(key: key);
  final IconData childIcon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      disabledElevation: 6.0,
      constraints: const BoxConstraints
              .tightFor //Used for getting the same size as default floating action button
          (
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(childIcon),
    );
  }
}
*/
