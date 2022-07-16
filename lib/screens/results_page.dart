import 'package:bmi_calculator/components/calculate_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:bmi_calculator/components/calculator_brain.dart';


class ResultsPage extends StatelessWidget {
   ResultsPage({Key? key, required this.bmiResult, required this.resultText, required this.interpretation,this.selectedGender}) : super(key: key);
  final String bmiResult;
  final String resultText;
  final String interpretation;
   String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                child: const Text(
                  'Your BMI',
                  style: kTitleTextStyle,
                ),
              ),
            ),
           /* const SizedBox(
              height: 30.0,
            ),*/
           // Expanded(child: Text(displayGender())),
            Expanded(
              flex: 5,
              child: ReusableCard(colour: kActiveCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  <Widget>[
                    Text(resultText.toUpperCase(),style: kResultTextStyle,),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,

                    ),
                    Text(interpretation,style: kSuggestionsTextStyle,
                    textAlign: TextAlign.center,),
                  ],
                ),
              ),),

            ),
            BottomButton(onTap: (){
              Navigator.pop(context);
            }, buttonTitle: 'Recalculate BMI')
          ],
        ));
  }

 /* String displayGender() {
    if(selectedGender==null) {
      selectedGender='No Gender Selected';
      return selectedGender.toString();
    } else {
      return selectedGender.toString();
    }
  }*/
}
