import 'dart:convert';

import 'package:assignment/pages/daily_panchang_screen/daily_panchang_model.dart';
import 'package:assignment/pages/talk_to_astrologer_screen/location_model.dart';
import 'package:assignment/services/api_service.dart';
import 'package:assignment/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class DailyPanchangCtrl extends GetxController {
  var selectedDate;
  var dateCtr = TextEditingController();
  var locCtr = TextEditingController();
  var showLocSugg = false.obs;
  var placeId = "";
  var showPanchag = false.obs;
  RxList<Datum?> locList = RxList();
  PanchangModel? response = null;

  void getLocations(search) async {
    var query = 'place?inputPlace=$search';
    LocationModel? response = await ApiService.getLocation(query);
    if (response!.success == true) {
      locList.clear();
      locList.assignAll(response.data!);
      showLocSugg.value = true;
    }
  }

  void getPanchang() async {
    var day = int.parse(dateCtr.text.substring(8, 10).toString());
    var month = int.parse(dateCtr.text.substring(5, 7).toString());
    var year = int.parse(dateCtr.text.substring(0, 4).toString());

    var data = {
      "day": day.toString(),
      "month": month.toString(),
      "year": year.toString(),
      "placeId": placeId
    };
    if (placeId.isNotEmpty) {
      response = await ApiService.getDailyPanchang(jsonEncode(data));
      if (response!.success == true) {
        showPanchag.value = true;
      }
    }
  }

  IconData getIcon(index) {
    if (index == 0) {
      return Icons.brightness_7;
    } else if (index == 1) {
      return Icons.brightness_5_sharp;
    } else if (index == 2) {
      return Icons.brightness_2;
    } else {
      return Icons.brightness_2_outlined;
    }
  }

  String getHeading(index) {
    if (index == 0) {
      return AppStrings.SUNRISE;
    } else if (index == 1) {
      return AppStrings.SUNSET;
    } else if (index == 2) {
      return AppStrings.Moonrise;
    } else {
      return AppStrings.Moonset;
    }
  }

  String getTime(index) {
    if (index == 0) {
      return response!.data!.sunrise;
    } else if (index == 1) {
      return response!.data!.sunset;
    } else if (index == 2) {
      return response!.data!.moonrise;
    } else {
      return response!.data!.moonset;
    }
  }
}
