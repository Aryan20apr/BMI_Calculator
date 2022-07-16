import 'package:flutter/material.dart';
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
