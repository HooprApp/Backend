import 'package:flutter/material.dart';

enum ButtonVariant { PRIMARY, SECONDARY }

class RoundedRectangleButton extends StatelessWidget {
  const RoundedRectangleButton({this.text, this.variant, this.onPressed});

  final String text;
  final ButtonVariant variant;
  final Function onPressed;

  Color buttonColor() {
    switch (variant) {
      case ButtonVariant.PRIMARY:
        return Colors.orange[600];
      case ButtonVariant.SECONDARY:
        return Colors.grey[200];
      default:
        return Colors.orange[600];
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: buttonColor(),
      child: Text(text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
      onPressed: onPressed,
    );
  }
}
