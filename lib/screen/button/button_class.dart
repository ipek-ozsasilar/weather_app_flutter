//flutter
import 'package:flutter/material.dart';
//model
import 'package:weather_app_with_api/model/weather_model.dart';
//screen
import 'package:weather_app_with_api/screen/radius/border_radius_class.dart';
import 'package:weather_app_with_api/screen/color/color_class.dart';
import 'package:weather_app_with_api/screen/end_page.dart';
import 'package:weather_app_with_api/screen/home_page.dart';
import 'package:weather_app_with_api/screen/navigator/navigator_class.dart';
import 'package:weather_app_with_api/screen/text/text_class.dart';

//text buton
class homePageTextButton extends StatelessWidget {
  final weatherModel? items;
  const homePageTextButton({
    super.key,
    required this.items,
  });

  

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          navigatorFunction().navigatoPush(
              endPage(
                items: items,
              ),
              context);
        },
        child: textWidget(
            text: "7 day weather forecast for click>>",
            color: Colors.black,
            TextWweight: FontWeight.bold,
            textSize: 12));
  }
}

//icon buton
class iconButtonWidget extends StatelessWidget {
  VoidCallback onPressed;
  IconData icon;
  iconButtonWidget({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: weatherColorClass.IconButtonColor,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: weatherColorClass.blackColor,
        ));
  }
}