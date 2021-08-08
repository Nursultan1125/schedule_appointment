import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final onPressed;
  final bool disabled;
  final String text;

  const PrimaryButton(
      {Key key, this.onPressed, this.disabled = false, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8, left: 8),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                disabled ? Color(0xC6D1D1D2) : Color(0xFF744CD0))),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: disabled ? null : onPressed,
      ),
    );
  }
}
