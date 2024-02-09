import 'package:contact_info/screen/adddata/adddata_screen.dart';
import 'package:contact_info/screen/detail/detail_screen.dart';
import 'package:contact_info/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

Map <String, WidgetBuilder> app_route={
  "/":(context) => HomeScreen(),
  "add_data":(context) => AddDataScreen(),
  "detail":(context) => DetailScreen(),
};