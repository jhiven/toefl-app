import 'package:flutter/material.dart';

final appTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light().copyWith(
    primary: const Color(0xff14487A), // button klik primary
    onPrimary: Color.fromARGB(255, 140, 168, 197), // putih untuk pop up dll nya
    surface: const Color.fromRGBO(0, 106, 106, 1), //profil edit , menu
    onSurface: const Color.fromRGBO(0, 0, 0, 1),
    secondary: const Color(0xffF6C410), // tulisan point
    secondaryContainer:
        const Color.fromRGBO(255, 223, 148, 1), // container welcome page
    onSecondaryContainer: const Color(0xffe8ecef),
    tertiary: const Color(0xffE3EDFF),
    tertiaryContainer: const Color.fromRGBO(211, 228, 255, 1),
    error: const Color.fromRGBO(186, 26, 26, 1),
    onError: const Color.fromRGBO(105, 5, 0, 1),
    errorContainer: const Color(0xffD16767),
    outlineVariant: const Color(0xff232e34),
    outline: Colors.grey, // text atau yang butuh abu abu
    scrim: const Color(0xff97DD60),
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        displayLarge: ThemeData.light()
            .textTheme
            .displayLarge!
            .copyWith(fontFamily: 'Poppins'),
        displayMedium: ThemeData.light()
            .textTheme
            .displayMedium!
            .copyWith(fontFamily: 'Roboto'),
        bodyLarge: ThemeData.light().textTheme.bodyLarge!.copyWith(
              fontFamily: 'Poppins',
            ),
        bodyMedium: ThemeData.light().textTheme.bodyMedium!.copyWith(
              fontFamily: 'Roboto',
            ),
        labelMedium: ThemeData.light().textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w900,
              fontFamily: 'Poppins',
            ),
      ),
);
