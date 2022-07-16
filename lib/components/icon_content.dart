import 'package:flutter/material.dart';
import 'constants.dart';
/*const labelTextStyle=TextStyle(
  fontSize: 20.0,
  color: Color(0xFF8D8E98),
);*///Moved this to separate constants file and importing from there
class IconContent extends StatelessWidget {
  const IconContent({required this.icon, required this.label});
  final IconData icon; //Icon expects a property called IconData
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: /*const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF8D8E98),
          ),*///Extracted to a separate constant to increase readability
          kLabelTextStyle
        )
      ],
    );
  }
}

