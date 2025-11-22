import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/font_weight_helper.dart';

abstract class AppStyles {
  static TextStyle bold32Black(BuildContext context) => TextStyle(
    fontSize: getResposiveFontSize(context, fontSize: 32),
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle semiBold18Black(BuildContext context) => TextStyle(
    fontSize: getResposiveFontSize(context, fontSize: 18),
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );

  static TextStyle normal16Grey(BuildContext context) => TextStyle(
    fontSize: getResposiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static TextStyle light12Black(BuildContext context) => TextStyle(
    fontSize: getResposiveFontSize(context, fontSize: 12),
    fontWeight: FontWeightHelper.light,
    color: Colors.black,
  );

  static TextStyle medium20Blue(BuildContext context) => TextStyle(
    fontSize: getResposiveFontSize(context, fontSize: 20),
    fontWeight: FontWeightHelper.medium,
    color: Colors.blue,
  );
  static TextStyle semiBold24Black(BuildContext context) => TextStyle(
    fontSize: getResposiveFontSize(context, fontSize: 24),
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle semiBold14Black(BuildContext context) => TextStyle(
    fontSize: getResposiveFontSize(context, fontSize: 14),
    fontWeight: FontWeightHelper.semiBold,
  );
}

double getResposiveFontSize(BuildContext context, {required double fontSize}) {
  double scale = _getScaleFactor(context);
  double responsiveFontSize = fontSize * scale;
  double maxFontSize = _getScaleFactor(context) * responsiveFontSize * 0.8;
  double minFontSize = _getScaleFactor(context) * responsiveFontSize * 0.2;
  return responsiveFontSize.clamp(minFontSize, maxFontSize);
}

double _getScaleFactor(BuildContext context) {
  final widthOfScreen = MediaQuery.sizeOf(context).width;
  if (widthOfScreen < 600) {
    return widthOfScreen / 400;
  } else if (widthOfScreen < 900) {
    return widthOfScreen / 700;
  } else {
    return widthOfScreen / 1000;
  }
}
