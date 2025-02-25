

import 'package:flutter/material.dart';

ThemeData appDarkTheme() => ThemeData(
  primaryColor: Colors.black,
  useMaterial3: true,
  fontFamily: 'Almarai',
  appBarTheme:  const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    )
  )
);