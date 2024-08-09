//dart
import 'dart:ui';
//flutter
import 'package:flutter/material.dart';
//model
import 'package:weather_app_with_api/model/weather_model.dart';
//screen
import 'package:weather_app_with_api/screen/radius/border_radius_class.dart';
import 'package:weather_app_with_api/screen/aligment/aligment_class.dart';
import 'package:weather_app_with_api/screen/button/button_class.dart';
import 'package:weather_app_with_api/screen/color/color_class.dart';
import 'package:weather_app_with_api/screen/end_page.dart';
import 'package:weather_app_with_api/screen/first_page.dart';
import 'package:weather_app_with_api/screen/icon/icon_class.dart';
import 'package:weather_app_with_api/screen/navigator/navigator_class.dart';
import 'package:weather_app_with_api/screen/padding/padding_class.dart';
import 'package:weather_app_with_api/screen/size/size_class.dart';
import 'package:weather_app_with_api/screen/text/text_class.dart';
//service
import 'package:weather_app_with_api/service/requests.dart';

class uiClass extends StatefulWidget {
  
  weatherModel? items;
  uiClass({
    Key? key,
   
    required this.items,
  }) : super(key: key);

  @override
  State<uiClass> createState() => _uiClassState();
}

class _uiClassState extends State<uiClass> {
  AlignmentGeometry textButtonAlligment=Alignment.centerRight;
  late List<textWidget> textWidgetList;
  late List<columnIconWidget> columnIconWidgetTopList;
  late List<columnIconWidget> columnIconWidgetUnderList;
  static var homePageContainerColor=Colors.deepPurple[300];

  
@override
  void initState() {
    super.initState();
       
        textWidgetList=[
        textWidget(text: widget.items?.city ??"",color: Colors.white,TextWweight: FontWeight.bold,textSize: 25),
        textWidget(text: "${widget.items?.result?[0].degree}°C" ?? "",color: Colors.white,TextWweight: FontWeight.bold,textSize: 40),
        textWidget(text: widget.items?.result?[0].status ?? "",color: Colors.white,TextWweight: FontWeight.bold,textSize: 25),
        textWidget(text:"${widget.items?.result?[0].date} "" ,${widget.items?.result?[0].day}" ?? "",color: Colors.white,TextWweight: FontWeight.bold,textSize: 18),
        ];

        columnIconWidgetTopList=[
        columnIconWidget(items: widget.items,propertyName: "Min",text: "${widget.items?.result?[0].min}°C" ?? "",icon: Icons.wind_power,),
        columnIconWidget(icon: Icons.sunny,text: "${widget.items?.result?[0].max}°C" ?? "",propertyName: "Max",items: widget.items),
        columnIconWidget(icon: Icons.nightlight,text: "${widget.items?.result?[0].night}°C" ?? "",propertyName: "Night",items: widget.items),
        ];

        columnIconWidgetUnderList=[
        columnIconWidget(items: widget.items,propertyName: "Humidity",text: "${widget.items?.result?[0].humidity}%" ?? "",icon: Icons.umbrella,),
        columnIconWidget(items: widget.items,propertyName: "Description",text: "${widget.items?.result?[0].description}" ?? "",icon: Icons.wind_power),
        columnIconWidget(items: widget.items,propertyName: "Degree",text: "${widget.items?.result?[0].degree}°C" ?? "",icon: Icons.rotate_90_degrees_ccw),
        ];
         
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: iconButtonWidget(
          icon: Icons.arrow_back,
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [
          iconButtonWidget(
              icon: Icons.refresh,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => uiClass(items: widget.items),));
              }),
        ],
      ),

      body: widget.items?.city==null ? Placeholder(color:weatherColorClass.redColor,) : ListView(
        padding: weatherPaddingClass.horizontalPadding+weatherPaddingClass.topPadding,
        children: [
          Center(
            child: Column(
              children: [
                ...textWidgetList, 
                imagePull(),
                Align(
                  alignment:textButtonAlligment ,
                  child: homePageTextButton(items: widget.items,),
                ),

                Container(
                  height: weatherSizeClass.containerHeight,
                  width: weatherSizeClass.containerWidhtAndImageSize,
                  child: Padding(
                    padding: weatherPaddingClass.allPadding,
                    child: Column(
                      crossAxisAlignment: weatherCrossAligment.start,
                      children: [
                        Row(
                          mainAxisAlignment: weatherMainAligment.spaceBetween,
                          children: [
                            ...columnIconWidgetTopList,
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: weatherMainAligment.spaceBetween,
                          children: [
                            ...columnIconWidgetUnderList,
                            
                          ],
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color:homePageContainerColor,
                    borderRadius: weatherBorderRadiusClass.containerRadius,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Image imagePull() {
    return Image.network(
                  widget.items?.result?[0].icon ?? "",
                  width: weatherSizeClass.containerWidhtAndImageSize,
                  height: weatherSizeClass.containerWidhtAndImageSize,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(weatherIconClass().errorIcon);
                  },
                );
  }

}