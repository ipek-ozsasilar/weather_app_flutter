//flutter
import 'package:flutter/material.dart';
//model
import 'package:weather_app_with_api/model/weather_model.dart';
//screen
import 'package:weather_app_with_api/screen/aligment/aligment_class.dart';
import 'package:weather_app_with_api/screen/color/color_class.dart';
import 'package:weather_app_with_api/screen/icon/icon_class.dart';
import 'package:weather_app_with_api/screen/padding/padding_class.dart';
import 'package:weather_app_with_api/screen/size/size_class.dart';
import 'package:weather_app_with_api/screen/text/text_class.dart';

class homePageContainer extends StatelessWidget {
  final weatherModel? items;
  final int selectIndex;
  homePageContainer({
    super.key,
    required this.items,
    required this.selectIndex,
  });
  late List<columnIconWidget> columnIconWidgetTop = [
    columnIconWidget(items:items,propertyName: "Min", text: "${items?.result?[selectIndex].min}°C",  icon: Icons.wind_power,),
    columnIconWidget(icon: Icons.sunny,text: "${items?.result?[selectIndex].max}°C",propertyName: "Max",items: items),
    columnIconWidget(icon: Icons.nightlight,text: "${items?.result?[selectIndex].night}°C",propertyName: "Night",items: items),
  ];
  late List<columnIconWidget> columnIconWidgetUnder = [
    columnIconWidget(items: items,propertyName: "Humidity",text: "${items?.result?[selectIndex].humidity}%",icon: Icons.umbrella,),
    columnIconWidget(items: items,propertyName: "Description",text: "${items?.result?[selectIndex].description}",icon: Icons.wind_power),
    columnIconWidget(items: items,propertyName: "Degree",text: "${items?.result?[selectIndex].degree}°C",icon: Icons.rotate_90_degrees_ccw),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: weatherSizeClass.containerWidhtAndImageSize,
        width: weatherSizeClass.containerWidhtAndImageSize,
        child: Card(
          color: weatherColorClass.transparentColor,
          child: Column(
            children: [
              Padding(
                padding: weatherPaddingClass.allPadding,
                child: Row(
                  mainAxisAlignment: weatherMainAligment.spaceAround,
                  crossAxisAlignment: weatherCrossAligment.start,
                  children: [
                    Image.network(
                      items?.result?[selectIndex].icon ?? "",
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(weatherIconClass().errorIcon),
                      height: weatherSizeClass.homePageImageSizes,
                      width: weatherSizeClass.homePageImageSizes,
                    ),
                    Column(
                      children: [
                        textWidget(
                            text: items?.result?[selectIndex].day ?? "",
                            color: Colors.white,
                            TextWweight: FontWeight.normal,
                            textSize: 20),
                        Divider(),
                        textWidget(
                            text: items?.result?[selectIndex].status ?? "",
                            color: Colors.white,
                            TextWweight: FontWeight.w300,
                            textSize: 20),
                        Divider(),
                        textWidget(
                            text: "${items?.result?[0].degree}°C" ?? "",
                            color: Colors.white,
                            TextWweight: FontWeight.bold,
                            textSize: 40),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: weatherMainAligment.spaceAround,
                children: [
                  ...columnIconWidgetTop,
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: weatherMainAligment.spaceAround,
                children: [
                  ...columnIconWidgetUnder,
                ],
              )
            ],
          ),
        ));
  }
}
