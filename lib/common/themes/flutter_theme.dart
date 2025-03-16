import 'package:flutter/material.dart';

import '../values/colors.dart';

BottomNavigationBarThemeData _buildBottomNavigationBar() {
  return BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryBackground,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.primaryElement,
      unselectedItemColor: AppColors.primaryFourthElementText, );
}

AppBarTheme _buildAppBarThem() {
  return AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primaryText),
      surfaceTintColor: AppColors.primaryBackground,
      elevation: 0,
      // color: Colors.white,
      backgroundColor: Colors.white);
}

ThemeData buildThemData() {
  return ThemeData(
    bottomNavigationBarTheme: _buildBottomNavigationBar(),
    appBarTheme: _buildAppBarThem(),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.primaryBackground,
  );
}
