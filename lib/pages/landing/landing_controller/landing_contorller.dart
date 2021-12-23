import 'package:assignment/pages/daily_panchang_screen/daily_panchang_view.dart';
import 'package:assignment/pages/talk_to_astrologer_screen/astrologer_view.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LandingCtr extends GetxController {
  var selected = 0.obs;

  Widget getView() {
    if (selected.value == 0)
      return DailyPanchang();
    else if (selected.value == 1)
      return AstrologerPage();
    else {
      return DailyPanchang();
    }
  }
}
