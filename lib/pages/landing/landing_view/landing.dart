import 'package:assignment/pages/landing/landing_controller/landing_contorller.dart';
import 'package:assignment/values/colors.dart';
import 'package:assignment/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Landing extends StatelessWidget {
  final landingCtr = Get.put(LandingCtr());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => landingCtr.getView()),
        bottomNavigationBar:
            Container(child: Obx(() => bottomNavBar(landingCtr))),
      ),
    );
  }
}

Widget bottomNavBar(LandingCtr ctrl) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-4, 0),
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: CupertinoColors.lightBackgroundGray)
              ]),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ctrl.selected.value == 0
                  ? InkWell(
                      onTap: () {
                        ctrl.selected.value = 0;
                      },
                      child: Image.asset(
                        IconsPath.ICON_HOME,
                        color: Color(AppColors.COLOR_PRIMARY),
                        height: 36,
                        width: 36,
                      ))
                  : InkWell(
                      onTap: () {
                        ctrl.selected.value = 0;
                      },
                      child: Container(
                          child: Image.asset(
                        IconsPath.ICON_HOME,
                        color: Colors.grey,
                        height: 36,
                        width: 36,
                      ))),

              ctrl.selected.value == 1
                  ? InkWell(
                      onTap: () {
                        ctrl.selected.value = 1;
                      },
                      child: Image.asset(
                        IconsPath.ICON_TALK,
                        color: Color(AppColors.COLOR_PRIMARY),
                        height: 36,
                        width: 36,
                      ))
                  : InkWell(
                      onTap: () {
                        ctrl.selected.value = 1;
                      },
                      child: Container(
                          child: Image.asset(
                        IconsPath.ICON_TALK,
                        color: Colors.grey,
                        height: 36,
                        width: 36,
                      ))),

              ctrl.selected.value == 2
                  ? InkWell(
                      onTap: () {
                        ctrl.selected.value = 1;
                      },
                      child: Image.asset(
                        IconsPath.ICON_ASK,
                        color: Color(AppColors.COLOR_PRIMARY),
                        height: 36,
                        width: 36,
                      ))
                  : InkWell(
                      onTap: () {
                        ctrl.selected.value = 1;
                      },
                      child: Container(
                          child: Image.asset(
                        IconsPath.ICON_ASK,
                        color: Colors.grey,
                        height: 36,
                        width: 36,
                      ))),

              ctrl.selected.value == 3
                  ? InkWell(
                      onTap: () {
                        ctrl.selected.value = 3;
                      },
                      child: Image.asset(
                        IconsPath.ICON_REPORT,
                        color: Color(AppColors.COLOR_PRIMARY),
                        height: 36,
                        width: 36,
                      ))
                  : InkWell(
                      onTap: () {
                        ctrl.selected.value = 3;
                      },
                      child: Container(
                          child: Image.asset(
                        IconsPath.ICON_REPORT,
                        color: Colors.grey,
                        height: 36,
                        width: 36,
                      ))),
              //)
            ],
          ),
        ),
      ) //)
    ],
  );
}
