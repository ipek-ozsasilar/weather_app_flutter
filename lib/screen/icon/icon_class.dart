//flutter
import 'package:flutter/material.dart';
//model
import 'package:weather_app_with_api/model/weather_model.dart';
//screen
import 'package:weather_app_with_api/screen/color/color_class.dart';
import 'package:weather_app_with_api/screen/text/text_class.dart';

//icon sınıfı
class weatherIconClass {
  IconData searchIcon = Icons.search;
  IconData backIcon = Icons.arrow_back;
  IconData refreshIcon = Icons.refresh;
  IconData errorIcon = Icons.error;
  IconData downIcon = Icons.arrow_drop_down_sharp;
  IconData upIcon = Icons.arrow_drop_up_sharp;
}

//colum icon widget
class columnIconWidget extends StatelessWidget {
  IconData icon;
  String text;
  String propertyName;
  final weatherModel? items;
  columnIconWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.propertyName,
    required this.items,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: weatherColorClass.iconColor,
        ),
        textWidget(
            text: text,
            color: Colors.white,
            TextWweight: FontWeight.w600,
            textSize: 17),
        textWidget(
            text: propertyName,
            color: Colors.white,
            TextWweight: FontWeight.normal,
            textSize: 15)
      ],
    );
  }
}
