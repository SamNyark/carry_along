import 'package:carry_along/constants/colors.dart';
import 'package:carry_along/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Nunito",
        scaffoldBackgroundColor: AppColor.bgColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColor.floatingColor)
      ), 
      home: HomePage(),
    );
  }
}
