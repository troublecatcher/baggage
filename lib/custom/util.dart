import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:baggage/features/baggage/home/model/measure/measure.dart';
import 'package:flutter/cupertino.dart';

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
}

Color hexToColor(String hexString) {
  hexString = hexString.toUpperCase().replaceAll('#', '');
  return Color(int.parse(hexString, radix: 16) + 0xFF000000);
}
