import 'package:assignment/pages/daily_panchang_screen/daily_panchang_controller.dart';
import 'package:assignment/values/colors.dart';
import 'package:assignment/values/strings.dart';
import 'package:assignment/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:get/get.dart';

class DailyPanchang extends StatelessWidget {
  final dpc = Get.put(DailyPanchangCtrl());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar.appBar(),
      body: Stack(
        children: [
          ListView(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                  Text(
                    AppStrings.HEADING2,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          AppStrings.PARA1,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(color: Color(AppColors.COLOR_PINK)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text(
                              AppStrings.DATE,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                                padding: EdgeInsets.only(left: 15),
                                color: Colors.white,
                                child: DateTimePicker(
                                  dateMask: 'dd MMMM, yyyy',
                                  controller: dpc.dateCtr,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black,
                                      )),
                                  type: DateTimePickerType.date,
                                  firstDate: DateTime(1995),
                                  lastDate: DateTime.now().add(Duration(
                                      days:
                                          365)), // This will add one year from current date
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      dpc.selectedDate = value;
                                      if (dpc.locCtr.text.isNotEmpty) {
                                        dpc.showPanchag.value = false;
                                        dpc.response = null;
                                        dpc.getPanchang();
                                      }
                                    }
                                  },
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text(
                              AppStrings.LOCATION,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                                padding: EdgeInsets.only(left: 15),
                                color: Colors.white,
                                child: //Obx(() =>
                                    TextField(
                                  controller: dpc.locCtr,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      dpc.showLocSugg.value = false;
                                      dpc.showPanchag.value = false;
                                      dpc.response = null;
                                      dpc.placeId = "";
                                    } else {
                                      dpc.showPanchag.value = false;
                                      dpc.response = null;
                                      dpc.placeId = "";
                                      dpc.getLocations(value);
                                    }
                                  },
                                ))) //),
                      ],
                    )
                  ],
                ),
              ),
              Obx(() => !dpc.showPanchag.value
                  ? Container()
                  : Container(
                      height: 100,
                      margin: EdgeInsets.only(
                          top: 10, right: 25, left: 25, bottom: 15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 5,
                                spreadRadius: 1,
                                color: CupertinoColors.lightBackgroundGray)
                          ]),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return timings(index);
                        },
                      ),
                    )),
              Obx(() => !dpc.showPanchag.value
                  ? Container()
                  : Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                AppStrings.SUB_HEADING1,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_TITHI_NO,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.tithi!.details!
                                      .tithiNumber
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_TITHI_NAME,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.tithi!.details!.tithiName
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_SPECIAL,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.tithi!.details!.special
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_SUMMARY,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.tithi!.details!.summary
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_DIETY,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.tithi!.details!.deity
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_END_TIME,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.tithi!.endTime!.hour
                                          .toString() +
                                      AppStrings.HOUR +
                                      dpc.response!.data!.tithi!.endTime!.minute
                                          .toString() +
                                      AppStrings.MIN +
                                      dpc.response!.data!.tithi!.endTime!.second
                                          .toString() +
                                      AppStrings.SEC,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                AppStrings.SUB_HEADING2,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_NAK_NO,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.nakshatra!.details!
                                      .nakNumber
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_NAK_NAME,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.nakshatra!.details!
                                      .nakName
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_RULER,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.nakshatra!.details!.ruler
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_DIETY,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.nakshatra!.details!.deity
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_SUMMARY,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.nakshatra!.details!
                                      .summary
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_END_TIME,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.nakshatra!.endTime!.hour
                                          .toString() +
                                      AppStrings.HOUR +
                                      dpc.response!.data!.nakshatra!.endTime!
                                          .minute
                                          .toString() +
                                      AppStrings.MIN +
                                      dpc.response!.data!.nakshatra!.endTime!
                                          .second
                                          .toString() +
                                      AppStrings.SEC,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                AppStrings.SUB_HEADING3,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_YOG_NO,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.yog!.details!.yogNumber
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_YOG_NAME,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.yog!.details!.yogName
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_SPECIAL,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.yog!.details!.special
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_MEANING,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.yog!.details!.meaning
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_END_TIME,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.yog!.endTime!.hour
                                          .toString() +
                                      AppStrings.HOUR +
                                      dpc.response!.data!.yog!.endTime!.minute
                                          .toString() +
                                      AppStrings.MIN +
                                      dpc.response!.data!.yog!.endTime!.second
                                          .toString() +
                                      AppStrings.SEC,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                AppStrings.SUB_HEADING4,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_KARAN_NO,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.karan!.details!
                                      .karanNumber
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_KARAN_NAME,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.karan!.details!.karanName
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_SPECIAL,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.karan!.details!.special
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_DIETY,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.karan!.details!.deity
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  AppStrings.TITLE_END_TIME,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  dpc.response!.data!.karan!.endTime!.hour
                                          .toString() +
                                      AppStrings.HOUR +
                                      dpc.response!.data!.karan!.endTime!.minute
                                          .toString() +
                                      AppStrings.MIN +
                                      dpc.response!.data!.karan!.endTime!.second
                                          .toString() +
                                      AppStrings.SEC,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ))
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 3.2,
            top: MediaQuery.of(context).size.height / 3.4,
            child: Obx(() => dpc.showLocSugg.value
                ? locationSuggestions(context)
                : Container()),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(AppColors.COLOR_PRIMARY),
        child: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    ));
  }

  Widget timings(index) {
    return Container(
        width: 150,
        padding: EdgeInsets.only(right: 0),
        decoration: BoxDecoration(
            border: index == 3
                ? null
                : Border(
                    right: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1))),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              dpc.getIcon(index),
              color: Colors.blue.shade100,
              size: 40,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dpc.getHeading(index),
                style: TextStyle(fontSize: 16, color: Colors.blue.shade300),
              ),
              Text(
                dpc.getTime(index),
                style: TextStyle(fontSize: 18),
              )
            ],
          )
        ]));
  }

  Widget locationSuggestions(context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(4, 4),
                  blurRadius: 5,
                  spreadRadius: 1,
                  color: CupertinoColors.lightBackgroundGray)
            ]),
        height: 250,
        width: MediaQuery.of(context).size.width / 1.7,
        child: Obx(() => dpc.locList.length > 0
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dpc.locList == null ? 0 : dpc.locList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      child: InkWell(
                        onTap: () {
                          dpc.locCtr.text = dpc.locList[index]!.placeName;
                          dpc.showLocSugg.value = false;
                          dpc.placeId = dpc.locList[index]!.placeId;
                          if (dpc.dateCtr.text.isEmpty) {
                          } else {
                            dpc.getPanchang();
                          }
                        },
                        child: Row(mainAxisSize: MainAxisSize.max, children: [
                          Expanded(
                              flex: 1,
                              child: Text(dpc.locList[index]!.placeName,
                                  style: TextStyle(fontSize: 20)))
                        ]),
                      ));
                },
              )
            : Container()));
  }
}
