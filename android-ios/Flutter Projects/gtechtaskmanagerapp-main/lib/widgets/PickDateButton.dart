import 'package:flutter/material.dart';

class PickDateButton extends StatelessWidget {
  const PickDateButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.date_range_outlined,
          color: Colors.black,
        ),
        const SizedBox(width: 5),
        Text(
          'Pick a date',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
