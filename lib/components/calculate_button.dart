import 'package:flutter/material.dart';

import 'constants.dart';
class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key, required this.onTap, required this.buttonTitle,
  }) : super(key: key);
  final void Function() onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,/*() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResultsPage()));
      }*/
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0),
          color:  kBottomContainerColor
        ),


        //color: kBottomContainerColor,
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
}