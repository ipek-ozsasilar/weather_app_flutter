//flutter
import 'package:flutter/material.dart';
//service
import 'package:flutter/services.dart';
//screen
import 'package:weather_app_with_api/screen/radius/border_radius_class.dart';
import 'package:weather_app_with_api/screen/color/color_class.dart';
import 'package:weather_app_with_api/screen/icon/icon_class.dart';
import 'package:weather_app_with_api/screen/padding/padding_class.dart';

//textfiedl widgetı
class inputWidget extends StatefulWidget {
  TextEditingController inputController = TextEditingController();
  inputWidget({super.key, required this.inputController});

  @override
  _inputWidgetState createState() => _inputWidgetState();
}

class _inputWidgetState extends State<inputWidget> {
  final String labelText = "Lütfen Bir Şehir giriniz";
  final double width = 2;
  final double fontSize = 20;
  final FontWeight fontWeight = FontWeight.w500;
  final FilteringTextInputFormatter textFieldFormatter =FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'));

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [textFieldFormatter],
      controller: widget.inputController,
      cursorColor: weatherColorClass.blackColor,
      decoration: InputDecoration(
        prefixIcon: Icon(weatherIconClass().searchIcon),
        prefixIconColor: weatherColorClass.blackColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: weatherBorderRadiusClass.textFieldRadius,
          borderSide:BorderSide(width: width, color: weatherColorClass.blackColor),
        ),
        contentPadding: weatherPaddingClass.textFieldContentPadding,
        labelText: labelText,
        labelStyle: TextStyle(
          color: weatherColorClass.blackColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
