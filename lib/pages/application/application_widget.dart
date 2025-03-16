import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    Center(
      child: Text("home"),
    ),
    Center(
      child: Text("search"),
    ),
    Center(
      child: Text("course"),
    ),
    Center(
      child: Text("chat"),
    ),
    Center(
      child: Text("profile"),
    ),
  ];

  return _widget[index];
}

BottomNavigationBarItem _buildBottomNavigationItem({
  required String icon,
  required String label
}) {
  return BottomNavigationBarItem(
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/${icon}.png",
          color: AppColors.primaryElement,
        ),
      ),
      label: label,
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/${icon}.png"),
      ));
}

var bottomTab = [
  _buildBottomNavigationItem(icon: "home", label: "home"),
  _buildBottomNavigationItem(icon: "search2", label: "search"),
  _buildBottomNavigationItem(icon: "play-circle1", label: "education"),
  _buildBottomNavigationItem(icon: "message-circle", label: "chat"),
  _buildBottomNavigationItem(icon: "person", label: "profile")
];
