//flutter
import 'package:flutter/material.dart';
//screen
import 'package:weather_app_with_api/screen/size/size_class.dart';

//ilk sayfa image metodu
SizedBox cloudImageAsset() {
  BoxFit coverFit = BoxFit.cover;
  String path = "assets/bulut.png";
  return SizedBox(
      height: weatherSizeClass.imageSizesAndCardWidht,
      width: weatherSizeClass.imageSizesAndCardWidht,
      child: Image.asset(
        path,
        fit: coverFit,
      ));
}
