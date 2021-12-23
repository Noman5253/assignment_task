import 'package:assignment/pages/landing/landing_view/landing.dart';
import 'package:assignment/values/colors.dart';
import 'package:assignment/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assingment',
      theme: ThemeData(
        primaryColor: AppColors.kPrimaryDarkColor,
        primaryColorDark: AppColors.kPrimaryColor,
      ),
      initialRoute: AppRoutes.ROUTE_DEFAULT,
      getPages: [
        GetPage(name: AppRoutes.ROUTE_DEFAULT, page: () => Landing()),
      ],
    );
  }
}
