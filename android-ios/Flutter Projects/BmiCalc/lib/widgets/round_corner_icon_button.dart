import 'package:flutter/material.dart';

class RoundCornerIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  RoundCornerIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 48,
        height: 48,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      fillColor: Color(0xff4c455e).withOpacity(.7),
    );
  }
}
