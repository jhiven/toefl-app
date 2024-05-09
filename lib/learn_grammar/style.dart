import 'dart:ui';

import 'package:flutter/material.dart';

const kPrimary = Color(0xff14487A);

class Style {
  static TextStyle getBlackBoldTextWhite({color = Colors.white, fontSize = 28.0, fontWeight = FontWeight.w700, fontFamily = 'Noto Sans'}){
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight
    );
  }

  static ButtonStyle getButtonStyle({foreGroundColor = Colors.white, backgroundColor = kPrimary, outlined = false}){
    return ElevatedButton.styleFrom(
                    foregroundColor: foreGroundColor,
                    backgroundColor: backgroundColor,
                    side: (outlined) ?  BorderSide(
                      color: kPrimary,
                      width: 1.0
                    ) : null
                );
  }
}