//flutter
import 'package:flutter/material.dart';
//model
import 'package:weather_app_with_api/model/weather_model.dart';
//screen
import 'package:weather_app_with_api/screen/radius/border_radius_class.dart';
import 'package:weather_app_with_api/screen/button/button_class.dart';
import 'package:weather_app_with_api/screen/color/color_class.dart';
import 'package:weather_app_with_api/screen/container/container_class.dart';
import 'package:weather_app_with_api/screen/home_page.dart';
import 'package:weather_app_with_api/screen/icon/icon_class.dart';
import 'package:weather_app_with_api/screen/padding/padding_class.dart';
import 'package:weather_app_with_api/screen/size/size_class.dart';
import 'package:weather_app_with_api/screen/text/text_class.dart';

class endPage extends StatefulWidget {
  weatherModel? items;

  endPage({
    Key? key,
    this.items,
  }) : super(key: key);

  @override
  State<endPage> createState() => _endPageState();
}

class _endPageState extends State<endPage> {
  //card widgetında basılan card'ın ındexıne gore contaıner wıdgetını cızmeye yarayan degısken
  int selectIndex = 1;
  bool isCenterTitle = true;
  MainAxisAlignment spaceAround = MainAxisAlignment.spaceAround;
  MainAxisAlignment spaceBetween = MainAxisAlignment.spaceBetween;
  @override
  Widget build(BuildContext context) {
    //ındex degıskenını guncelleme
    void updateIndex(int index) {
      setState(() {
        selectIndex = index;
      });
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: isCenterTitle,
          title: textWidget(
              text: "7 days",
              color: Colors.white,
              TextWweight: FontWeight.bold,
              textSize: 20),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => endPage(
                                items: widget.items,
                              )));
                }),
          ],
        ),
        body: Padding(
          padding: weatherPaddingClass.horizontalPadding,
          child: Column(
            children: [
              homePageContainer(items: widget.items, selectIndex: selectIndex),
              Expanded(
                child: ListView.builder(
                    padding: weatherPaddingClass.listBuilderTopPadding,
                    itemCount: widget.items?.result?.length ?? 0,
                    itemBuilder: (((BuildContext context, int index) {
                      return SizedBox(
                        height: weatherSizeClass.cardHeight,
                        width: weatherSizeClass.imageSizesAndCardWidht,
                        child: Card(
                          color: weatherColorClass.transparentColor,
                          child: TextButton(
                            onPressed: () {
                              updateIndex(index);
                            },
                            child: ListTile(
                              title: SizedBox(
                                height: weatherSizeClass.sizedboxHeight,
                                width: weatherSizeClass.sizedboxWidht,
                                child: Row(
                                  mainAxisAlignment: spaceAround,
                                  children: [
                                    Image.network(
                                        widget.items?.result?[index].icon ??
                                            ""),
                                    textWidget(
                                        text: widget
                                                .items?.result?[index].status ??
                                            "",
                                        color: Colors.white,
                                        TextWweight: FontWeight.bold,
                                        textSize: 13),
                                  ],
                                ),
                              ),
                              leading: SizedBox(
                                  width: weatherSizeClass.leadingWidth,
                                  child: textWidget(
                                      text: widget.items?.result?[index].day ??
                                          "null",
                                      color: Colors.white,
                                      TextWweight: FontWeight.bold,
                                      textSize: 13)),
                              trailing: SizedBox(
                                height: weatherSizeClass.sizedboxHeight,
                                width: weatherSizeClass.listTileTrailingWidht,
                                child: Row(
                                  mainAxisAlignment: spaceBetween,
                                  children: [
                                    Icon(
                                      weatherIconClass().downIcon,
                                      color: weatherColorClass.redColor,
                                    ),
                                    textWidget(
                                        text: (double.tryParse(widget
                                                            .items
                                                            ?.result?[index]
                                                            .min ??
                                                        '')
                                                    ?.toInt() ??
                                                0)
                                            .toString(),
                                        color: Colors.white,
                                        TextWweight: FontWeight.bold,
                                        textSize: 13),
                                    Spacer(),
                                    Icon(weatherIconClass().upIcon,
                                        color:
                                            weatherColorClass.greenAccentColor),
                                    textWidget(
                                        text: (double.tryParse(widget
                                                            .items
                                                            ?.result?[index]
                                                            .max ??
                                                        '')
                                                    ?.toInt() ??
                                                0)
                                            .toString(),
                                        color: Colors.white,
                                        TextWweight: FontWeight.bold,
                                        textSize: 13),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }))),
              ),
            ],
          ),
        ));
  }
}
