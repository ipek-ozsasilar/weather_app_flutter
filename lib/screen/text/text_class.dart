//flutter
import 'package:flutter/material.dart';

//text widgetı
class textWidget extends StatelessWidget {
  String text;
  Color color;
  FontWeight TextWweight;
  double textSize;
  textWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.TextWweight,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: textSize,
        fontWeight: TextWweight,
      ),
    );
  }
}
