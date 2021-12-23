import 'package:assignment/pages/talk_to_astrologer_screen/astrologer_controller.dart';
import 'package:assignment/values/colors.dart';
import 'package:assignment/values/dimen.dart';
import 'package:assignment/values/strings.dart';
import 'package:assignment/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AstrologerPage extends StatelessWidget {
  final astroCtrl = Get.put(AstroCtr());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar.appBar(),
      body: Stack(
        children: [
          Obx(() => Padding(
              padding:
                  EdgeInsets.only(top: astroCtrl.showSearch.value ? 140 : 60),
              child: ListView(
                children: [
                  Obx(() => astroCtrl.agentsList.length > 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: astroCtrl.agentsList == null
                              ? 0
                              : astroCtrl.agentsList.length,
                          itemBuilder: (context, index) {
                            return astroCard(context, index);
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Color(AppColors.COLOR_PRIMARY),
                          ),
                        ))
                ],
              ))),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 2.4,
            child: Obx(() =>
                astroCtrl.showSort.value ? sortDilaog(context) : Container()),
          ),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 2.4,
            child: Obx(() => astroCtrl.showFilter.value
                ? filterDilaog(context)
                : Container()),
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.HEADING1,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              astroCtrl.showSearch.value = true;
                            },
                            child: Image.asset(
                              IconsPath.ICON_SEARCH,
                              width: Dimen.ICON_DIMEN,
                              height: Dimen.ICON_DIMEN,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                astroCtrl.toggleFilter();
                              },
                              child: Image.asset(
                                IconsPath.ICON_FILTER,
                                width: Dimen.ICON_DIMEN,
                                height: Dimen.ICON_DIMEN,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              astroCtrl.toggleSort();
                            },
                            child: Image.asset(
                              IconsPath.ICON_SORT,
                              width: Dimen.ICON_DIMEN,
                              height: Dimen.ICON_DIMEN,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Obx(() => astroCtrl.showSearch.value
                      ? Container(
                          height: Dimen.TF_CONTAINER_HEIGHT_DIMEN,
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    color: CupertinoColors.lightBackgroundGray)
                              ]),
                          child: TextField(
                            controller: astroCtrl.searchCtr,
                            onSubmitted: (value) {
                              astroCtrl.searchAgent(value);
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color(AppColors.COLOR_PRIMARY),
                                ),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      astroCtrl.toggleSearch();
                                      astroCtrl.agentsList.clear();
                                      astroCtrl.agentsList
                                          .assignAll(astroCtrl.agentsMainList);
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Color(AppColors.COLOR_PRIMARY),
                                    )),
                                hintText: AppStrings.HINT_SEARCH,
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                )),
                          ),
                        )
                      : Container()),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget astroCard(context, index) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.network(astroCtrl.getImageOfAgent(index),
                          errorBuilder: (context, error, stackTrace) {
                        return Container();
                      }, height: 100, fit: BoxFit.fill))),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        astroCtrl.agentsList[index]!.firstName +
                            " " +
                            astroCtrl.agentsList[index]!.lastName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.self_improvement,
                            color: Color(AppColors.COLOR_PRIMARY),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child:
                                Text(astroCtrl.getSkillsOfAgent(index, 'a')!))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.translate,
                              color: Color(AppColors.COLOR_PRIMARY),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Text(
                                  astroCtrl.getLanguagesOfAgent(index, 'a')!))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.subtitles,
                            color: Color(AppColors.COLOR_PRIMARY),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              AppStrings.RUPEE_SYMBER +
                                  astroCtrl.agentsList[index]!
                                      .additionalPerMinuteCharges
                                      .toString() +
                                  AppStrings.PER_MIN,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.call_outlined,
                                    color: Colors.white,
                                  )),
                              Text(AppStrings.BUTTON_TEXT,
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(AppColors.COLOR_PRIMARY)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                        ))
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      astroCtrl.agentsList[index]!.experience.toString() +
                          AppStrings.TITLE_YEAR,
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                color: Colors.grey.shade200,
                endIndent: 20,
                indent: 20,
                height: 3,
                thickness: 3,
              ))
        ],
      ),
    );
  }

  Widget sortDilaog(context) {
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
      padding: EdgeInsets.only(top: 16, right: 26, left: 16, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.HEADING_SORT,
            style:
                TextStyle(color: Color(AppColors.COLOR_PRIMARY), fontSize: 18),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: Colors.grey.shade200,
                height: 3,
              )),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.r0.value,
                  groupValue: astroCtrl.radioGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.radioGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.sortAgents(value);
                  })),
              Text(AppStrings.TITLE_EHL)
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.r1.value,
                  groupValue: astroCtrl.radioGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.radioGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.sortAgents(value);
                  })),
              Text(AppStrings.TITLE_ELH)
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.r2.value,
                  groupValue: astroCtrl.radioGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.radioGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.sortAgents(value);
                  })),
              Text(AppStrings.TITLE_PHL)
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.r3.value,
                  groupValue: astroCtrl.radioGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.radioGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.sortAgents(value);
                  })),
              Text(AppStrings.TITLE_PLH)
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.r4.value,
                  groupValue: astroCtrl.radioGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.radioGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.sortAgents(value);
                  })),
              Text(AppStrings.TITLE_NONE)
            ],
          )
        ],
      ),
    );
  }

  Widget filterDilaog(context) {
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
      padding: EdgeInsets.only(top: 16, right: 26, left: 16, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.HEADING_FILTER,
            style:
                TextStyle(color: Color(AppColors.COLOR_PRIMARY), fontSize: 18),
          ),
          Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                AppStrings.TITLE_LANG,
                style: TextStyle(
                    color: Color(AppColors.COLOR_PRIMARY), fontSize: 18),
              )),
          Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: Colors.grey.shade200,
                height: 3,
              )),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.fl0.value,
                  groupValue: astroCtrl.filterLangGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.filterLangGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.filterByLang(value);
                  })),
              Text(AppStrings.TITLE_LANG1)
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.fl1.value,
                  groupValue: astroCtrl.filterLangGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.filterLangGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.filterByLang(value);
                  })),
              Text(AppStrings.TITLE_LANG2)
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.fl2.value,
                  groupValue: astroCtrl.filterLangGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.filterLangGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.filterByLang(value);
                  })),
              Text(AppStrings.TITLE_NONE)
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                AppStrings.TITLE_SKILLS,
                style: TextStyle(
                    color: Color(AppColors.COLOR_PRIMARY), fontSize: 18),
              )),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.fs0.value,
                  groupValue: astroCtrl.filterSkillGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.filterSkillGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.filterBySkill(value);
                  })),
              Text(AppStrings.TITLE_SKILL1)
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.fs1.value,
                  groupValue: astroCtrl.filterSkillGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.filterSkillGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.filterBySkill(value);
                  })),
              Text(AppStrings.TITLE_SKILL2)
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                  value: astroCtrl.fs2.value,
                  groupValue: astroCtrl.filterSkillGroupVal.value,
                  onChanged: (int? value) {
                    astroCtrl.filterSkillGroupVal.value = value!;
                    astroCtrl.update();
                    astroCtrl.filterBySkill(value);
                  })),
              Text(AppStrings.TITLE_NONE)
            ],
          )
        ],
      ),
    );
  }
}
