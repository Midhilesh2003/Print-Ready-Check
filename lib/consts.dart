import 'package:flutter/material.dart';

// ignore_for_file: constant_identifier_names

const String Poppins = "Poppins-Regular";
const String Poppinsbold ="Poppins-bold";
TextStyle textStyle({color = Colors.black87,double? size = 16,font = Poppinsbold}) {
  return TextStyle(
    fontFamily: font,
    color: color,
    fontSize: size,
  );
}