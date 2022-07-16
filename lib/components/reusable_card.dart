import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  // const ReusableCard( {Key? key,} ) : super(key: key);
  const ReusableCard({Key? key, required this.colour, this.cardChild,  this.onPress})
      : super(key: key); //Required makes this property required.
  final Color
  colour; //final makes this property immutable. Therefore we can't change this.
  final Widget? cardChild ;//? Makes this nullable
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,//We can specify a function that will be called when gesture detector detects a tap on the reusableCard
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: /*const Color(
                0xFF1D1E33)*/
            colour, //If we are using box decoration, color property need to be specified here instead of above
            borderRadius: BorderRadius.circular(
                10.0) //This is used to give circular shape to the edges of the container
        ),
        child: cardChild,
      ),
    );
  }
}
