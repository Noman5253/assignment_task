import 'package:assignment/pages/talk_to_astrologer_screen/astrologer_model.dart';
import 'package:assignment/services/api_service.dart';
import 'package:assignment/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AstroCtr extends GetxController {
  var showSearch = false.obs;
  var showSort = false.obs;
  var showFilter = false.obs;
  RxList<Datum?> agentsList = RxList();
  RxList<Datum?> agentsMainList = RxList();
  RxList<Datum?> agentsSearchedList = RxList();
  RxList<Datum?> agentsFilteredList = RxList();
  RxList<Datum?> agentsFilteredSkillList = RxList();
  RxList<Datum?> agentsSortedList = RxList();
  var searchCtr = TextEditingController();
  var radioGroupVal = 4.obs;
  var filterLangGroupVal = 2.obs;
  var filterSkillGroupVal = 2.obs;

  var r0 = 0.obs;
  var r1 = 1.obs;
  var r2 = 2.obs;
  var r3 = 3.obs;
  var r4 = 4.obs;

  var fl0 = 0.obs;
  var fl1 = 1.obs;
  var fl2 = 2.obs;
  var fs0 = 0.obs;
  var fs1 = 1.obs;
  var fs2 = 2.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    AstrologerModel? response = await ApiService.getAgents();
    if (response!.success == true) {
      if (response.data!.length > 0) {
        agentsList.assignAll(response.data!);
        agentsMainList.assignAll(response.data!);
      }
    }
  }

  String? getLanguagesOfAgent(index, listType) {
    if (listType == 'a') {
      var languages = '';
      for (Language? lang in agentsList[index]!.languages!) {
        languages = languages + lang!.name + ", ";
      }
      var trimLen = languages.length - 2;
      if (languages.length > 2) languages = languages.substring(0, trimLen);
      return languages;
    }
    if (listType == 'm') {
      var languages = '';
      for (Language? lang in agentsMainList[index]!.languages!) {
        languages = languages + lang!.name + ", ";
      }
      var trimLen = languages.length - 2;
      if (languages.length > 2) languages = languages.substring(0, trimLen);
      return languages;
    }
  }

  String? getSkillsOfAgent(index, listType) {
    if (listType == 'a') {
      var skills = '';
      for (Skill? skill in agentsList[index]!.skills!) {
        skills = skills + skill!.name + ", ";
      }
      var trimLen = skills.length - 2;
      if (skills.length > 2) skills = skills.substring(0, trimLen);
      return skills;
    }
    if (listType == 'm') {
      var skills = '';
      for (Skill? skill in agentsMainList[index]!.skills!) {
        skills = skills + skill!.name + ", ";
      }
      var trimLen = skills.length - 2;
      if (skills.length > 2) skills = skills.substring(0, trimLen);
      return skills;
    }
  }

  String getImageOfAgent(index) {
    var url;
    url = agentsList[index]!.images!.medium!.imageUrl!;
    return url;
  }

  void toggleSearch() {
    showSearch.value = !showSearch.value;
  }

  void toggleSort() {
    showSort.value = !showSort.value;
  }

  void toggleFilter() {
    showFilter.value = !showFilter.value;
  }

  void searchAgent(String searchReq) {
    agentsSearchedList.clear();
    for (var i = 0; i < agentsMainList.length; i++) {
      searchReq = searchReq.toLowerCase();
      if (searchReq == agentsMainList[i]!.firstName.toString().toLowerCase() ||
          searchReq == agentsMainList[i]!.lastName.toString().toLowerCase() ||
          isAddOnBasisOfLanguage(i, searchReq) ||
          isBasedOnSkills(i, searchReq)) {
        agentsSearchedList.add(agentsMainList[i]);
      }
    }
    agentsList.clear();
    agentsList.assignAll(agentsSearchedList);
  }

  bool isAddOnBasisOfLanguage(index, searchReq) {
    var languages = getLanguagesOfAgent(index, 'm');
    return languages.toString().toLowerCase().contains(searchReq);
  }

  bool isBasedOnSkills(index, searchReq) {
    var skills = getSkillsOfAgent(index, 'm');
    return skills.toString().toLowerCase().contains(searchReq);
  }

  void sortAgents(sortType) {
    agentsSortedList.clear();
    agentsList.clear();
    agentsSortedList.assignAll(agentsMainList);
    //0 -> Exp h to l
    print(sortType);
    if (sortType == 0) {
      agentsSortedList.sort((a, b) => a!.experience.compareTo(b!.experience));
      agentsList.assignAll(agentsSortedList.reversed);
    }
    //1 -> Exp l to h
    if (sortType == 1) {
      agentsSortedList.sort((a, b) => a!.experience.compareTo(b!.experience));
      agentsList.assignAll(agentsSortedList);
    }
    //2 -> price h to l
    if (sortType == 2) {
      agentsSortedList.sort((a, b) => a!.additionalPerMinuteCharges
          .compareTo(b!.additionalPerMinuteCharges));
      agentsList.assignAll(agentsSortedList.reversed);
    }
    //3 -> price l to h
    if (sortType == 3) {
      agentsSortedList.sort((a, b) => a!.additionalPerMinuteCharges
          .compareTo(b!.additionalPerMinuteCharges));
      agentsList.assignAll(agentsSortedList);
    }

    if (sortType == 4) {
      agentsList.assignAll(agentsMainList);
    }
  }

  void filterByLang(langType) {
    agentsList.clear();
    agentsFilteredList.clear();
    //english
    if (langType == fl0.value) {
      for (var i = 0; i < agentsMainList.length; i++) {
        if (isAddOnBasisOfLanguage(i, AppStrings.TITLE_LANG1.toLowerCase())) {
          agentsFilteredList.add(agentsMainList[i]);
        }
      }
      agentsList.assignAll(agentsFilteredList);
    }
    //hindi
    else if (langType == fl1.value) {
      for (var i = 0; i < agentsMainList.length; i++) {
        if (isAddOnBasisOfLanguage(i, AppStrings.TITLE_LANG2.toLowerCase())) {
          agentsFilteredList.add(agentsMainList[i]);
        }
      }
      agentsList.assignAll(agentsFilteredList);
    }
    //none
    else {
      agentsList.assignAll(agentsMainList);
    }
  }

  void filterBySkill(langType) {
    agentsList.clear();
    agentsFilteredSkillList.clear();
    //vastu
    if (langType == fs0.value) {
      for (var i = 0; i < agentsMainList.length; i++) {
        if (isBasedOnSkills(i, AppStrings.TITLE_SKILL1.toLowerCase())) {
          agentsFilteredSkillList.add(agentsMainList[i]);
        }
      }
      agentsList.assignAll(agentsFilteredSkillList);
    }
    //hindi
    else if (langType == fs1.value) {
      for (var i = 0; i < agentsMainList.length; i++) {
        if (isBasedOnSkills(i, AppStrings.TITLE_SKILL2.toLowerCase())) {
          agentsFilteredSkillList.add(agentsMainList[i]);
        }
      }
      agentsList.assignAll(agentsFilteredSkillList);
    }
    //none
    else {
      agentsList.assignAll(agentsMainList);
    }
  }
}
