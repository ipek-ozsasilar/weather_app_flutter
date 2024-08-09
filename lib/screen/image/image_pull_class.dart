//flutter
import 'package:flutter/material.dart';
//lottie
import 'package:lottie/lottie.dart';
//screen
import 'package:weather_app_with_api/screen/size/size_class.dart';

//ilk sayfa animation
LottieBuilder cloudImageAsset() {
  String path = "assets/animation.json";
  return LottieBuilder.asset(path,
      height: weatherSizeClass.imageSizesAndCardWidht,
      width: weatherSizeClass.imageSizesAndCardWidht);
}
