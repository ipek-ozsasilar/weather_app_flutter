//flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//lottie
import 'package:lottie/lottie.dart';
//model
import 'package:weather_app_with_api/model/weather_model.dart';
import 'package:weather_app_with_api/screen/text/text_class.dart';
//service
import 'package:weather_app_with_api/service/requests.dart';
//screen
import 'package:weather_app_with_api/screen/radius/border_radius_class.dart';
import 'package:weather_app_with_api/screen/color/color_class.dart';
import 'package:weather_app_with_api/screen/home_page.dart';
import 'package:weather_app_with_api/screen/icon/icon_class.dart';
import 'package:weather_app_with_api/screen/image/image_pull_class.dart';
import 'package:weather_app_with_api/screen/navigator/navigator_class.dart';
import 'package:weather_app_with_api/screen/padding/padding_class.dart';
import 'package:weather_app_with_api/screen/size/size_class.dart';
import 'package:weather_app_with_api/screen/textField/text_field_class.dart';

class startPage extends StatefulWidget {
  const startPage({super.key});

  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  //change loading fonksıyonunu kontrol eden degısken
  bool isLoading = false;
  weatherModel? items;
  TextEditingController Controller = TextEditingController();

  //dataları api den cektıgımız fonksıyon
  Future<void> pullData() async {
    changeLoading();
    items = await weatherService().getRequestWeather("tr", Controller.text, context);
    changeLoading();
  }

  //loadıngı kontrol ettıgımız fonksıyon
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: weatherPaddingClass.horizontalPadding,
            child: Column(
              children: [
                Padding(
                  padding: weatherPaddingClass.topPadding,
                  child: inputWidget(
                    inputController: Controller,
                  ),
                ),
                Center(
                  child: cloudImageAsset(),
                ),
                Padding(
                  padding: weatherPaddingClass.textButtonTopPadding,
                  child: firstPageTextButton(context),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  //ilk sayfanın text butonu
  TextButton firstPageTextButton(BuildContext context) {
    return TextButton(
        //loadıng donuyosa yanı datalar yuklenıyosa tekrar basmaya ızın verme
        onPressed: isLoading
            ? null
            : () async {
                if (Controller.text.isEmpty) return;
                await pullData();
                //ıkıncı sayfaya gecıs yapıyoruz
                navigatorFunction().navigatoPush(
                  uiClass(
                    items: items,
                  ),
                  context,
                );
              },
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: weatherBorderRadiusClass.containerRadius),
            backgroundColor: weatherColorClass.IconButtonColor),
        child: SizedBox(
          height: weatherSizeClass.textButtonHeight,
          width: weatherSizeClass.textButtonWidht,
          child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : textWidget(
                      text: "Let's get started",
                      color: Colors.black,
                      TextWweight: FontWeight.bold,
                      textSize: 25)),
        ));
  }
}
