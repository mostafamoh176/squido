import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

void main() async {
  final sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: sharedPref,
  ));
}
