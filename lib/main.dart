import 'package:carry_along/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'controllers/init_controller.dart' as binding;
import 'helpers/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await binding.initBinding();
  runApp(const MyApp());
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
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: AppColor.floatingColor)),
      home: const HomePage(),
    );
  }
}
