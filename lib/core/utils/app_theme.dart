

import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData appTheme()
{
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Almarai',
    appBarTheme:  const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      )
    )
  );
}