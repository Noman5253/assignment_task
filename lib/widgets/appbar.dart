import 'package:assignment/values/strings.dart';
import 'package:flutter/material.dart';

class DefaultAppBar {
  static appBar() {
    return PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: SafeArea(
          child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          IconsPath.ICON_HAMBURGER,
                          height: 24,
                        ),
                        Image.asset(
                          IconsPath.ICON_LOGO,
                          height: 34,
                        ),
                        Image.asset(
                          IconsPath.ICON_PROFILE,
                          height: 34,
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
