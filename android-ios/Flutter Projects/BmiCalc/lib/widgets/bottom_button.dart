import 'package:flutter/material.dart';

import '/widgets/reusable_card.dart';
import '/utils/constants.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  BottomButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kButtonContainerHeight,
        child: ReusableCard(
          color: kPink,
          child: Center(
            child: Text(
              text,
              style: kLargeButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
