import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() onSubmit;
  const Button({
    super.key,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSubmit,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 250, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.red[200], borderRadius: BorderRadius.circular(6)),
        child: Text(
          'S U B M I T',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
