import 'package:booklyapp/constants.dart';
import 'package:flutter/cupertino.dart';

abstract class Styles {
  static const textStyleS18W600 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textStyleS20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textStyleS30W900 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontFamily: kGtSectraFine,
    letterSpacing: 1.2,
  );
  static const textStyleS14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyleS16W500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

const TextStyle textStyle = TextStyle();
