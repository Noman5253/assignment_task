// To parse this JSON data, do
//
//     final panchangModel = panchangModelFromJson(jsonString);

import 'dart:convert';

PanchangModel panchangModelFromJson(String str) =>
    PanchangModel.fromJson(json.decode(str));

String panchangModelToJson(PanchangModel data) => json.encode(data.toJson());

class PanchangModel {
  PanchangModel({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  var httpStatus;
  var httpStatusCode;
  var success;
  var message;
  var apiName;
  Data? data;

  factory PanchangModel.fromJson(Map<String, dynamic> json) => PanchangModel(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.day,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.vedicSunrise,
    this.vedicSunset,
    this.tithi,
    this.nakshatra,
    this.yog,
    this.karan,
    this.hinduMaah,
    this.paksha,
    this.ritu,
    this.sunSign,
    this.moonSign,
    this.ayana,
    this.panchangYog,
    this.vikramSamvat,
    this.shakaSamvat,
    this.vkramSamvatName,
    this.shakaSamvatName,
    this.dishaShool,
    this.dishaShoolRemedies,
    this.nakShool,
    this.moonNivas,
    this.abhijitMuhurta,
    this.rahukaal,
    this.guliKaal,
    this.yamghantKaal,
  });

  var day;
  var sunrise;
  var sunset;
  var moonrise;
  var moonset;
  var vedicSunrise;
  var vedicSunset;
  Tithi? tithi;
  Nakshatra? nakshatra;
  Yog? yog;
  Karan? karan;
  HinduMaah? hinduMaah;
  var paksha;
  var ritu;
  var sunSign;
  var moonSign;
  var ayana;
  var panchangYog;
  var vikramSamvat;
  var shakaSamvat;
  var vkramSamvatName;
  var shakaSamvatName;
  var dishaShool;
  var dishaShoolRemedies;
  NakShool? nakShool;
  var moonNivas;
  AbhijitMuhurta? abhijitMuhurta;
  AbhijitMuhurta? rahukaal;
  AbhijitMuhurta? guliKaal;
  AbhijitMuhurta? yamghantKaal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        day: json["day"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        vedicSunrise: json["vedic_sunrise"],
        vedicSunset: json["vedic_sunset"],
        tithi: Tithi.fromJson(json["tithi"]),
        nakshatra: Nakshatra.fromJson(json["nakshatra"]),
        yog: Yog.fromJson(json["yog"]),
        karan: Karan.fromJson(json["karan"]),
        hinduMaah: HinduMaah.fromJson(json["hindu_maah"]),
        paksha: json["paksha"],
        ritu: json["ritu"],
        sunSign: json["sun_sign"],
        moonSign: json["moon_sign"],
        ayana: json["ayana"],
        panchangYog: json["panchang_yog"],
        vikramSamvat: json["vikram_samvat"],
        shakaSamvat: json["shaka_samvat"],
        vkramSamvatName: json["vkram_samvat_name"],
        shakaSamvatName: json["shaka_samvat_name"],
        dishaShool: json["disha_shool"],
        dishaShoolRemedies: json["disha_shool_remedies"],
        nakShool: NakShool.fromJson(json["nak_shool"]),
        moonNivas: json["moon_nivas"],
        abhijitMuhurta: AbhijitMuhurta.fromJson(json["abhijit_muhurta"]),
        rahukaal: AbhijitMuhurta.fromJson(json["rahukaal"]),
        guliKaal: AbhijitMuhurta.fromJson(json["guliKaal"]),
        yamghantKaal: AbhijitMuhurta.fromJson(json["yamghant_kaal"]),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "vedic_sunrise": vedicSunrise,
        "vedic_sunset": vedicSunset,
        "tithi": tithi!.toJson(),
        "nakshatra": nakshatra!.toJson(),
        "yog": yog!.toJson(),
        "karan": karan!.toJson(),
        "hindu_maah": hinduMaah!.toJson(),
        "paksha": paksha,
        "ritu": ritu,
        "sun_sign": sunSign,
        "moon_sign": moonSign,
        "ayana": ayana,
        "panchang_yog": panchangYog,
        "vikram_samvat": vikramSamvat,
        "shaka_samvat": shakaSamvat,
        "vkram_samvat_name": vkramSamvatName,
        "shaka_samvat_name": shakaSamvatName,
        "disha_shool": dishaShool,
        "disha_shool_remedies": dishaShoolRemedies,
        "nak_shool": nakShool!.toJson(),
        "moon_nivas": moonNivas,
        "abhijit_muhurta": abhijitMuhurta!.toJson(),
        "rahukaal": rahukaal!.toJson(),
        "guliKaal": guliKaal!.toJson(),
        "yamghant_kaal": yamghantKaal!.toJson(),
      };
}

class AbhijitMuhurta {
  AbhijitMuhurta({
    this.start,
    this.end,
  });

  var start;
  var end;

  factory AbhijitMuhurta.fromJson(Map<String, dynamic> json) => AbhijitMuhurta(
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
      };
}

class HinduMaah {
  HinduMaah({
    this.adhikStatus,
    this.purnimanta,
    this.amanta,
    this.amantaId,
    this.purnimantaId,
  });

  var adhikStatus;
  var purnimanta;
  var amanta;
  var amantaId;
  var purnimantaId;

  factory HinduMaah.fromJson(Map<String, dynamic> json) => HinduMaah(
        adhikStatus: json["adhik_status"],
        purnimanta: json["purnimanta"],
        amanta: json["amanta"],
        amantaId: json["amanta_id"],
        purnimantaId: json["purnimanta_id"],
      );

  Map<String, dynamic> toJson() => {
        "adhik_status": adhikStatus,
        "purnimanta": purnimanta,
        "amanta": amanta,
        "amanta_id": amantaId,
        "purnimanta_id": purnimantaId,
      };
}

class Karan {
  Karan({
    this.details,
    this.endTime,
    this.endTimeMs,
  });

  KaranDetails? details;
  EndTime? endTime;
  var endTimeMs;

  factory Karan.fromJson(Map<String, dynamic> json) => Karan(
        details: KaranDetails.fromJson(json["details"]),
        endTime: EndTime.fromJson(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toJson() => {
        "details": details!.toJson(),
        "end_time": endTime!.toJson(),
        "end_time_ms": endTimeMs,
      };
}

class KaranDetails {
  KaranDetails({
    this.karanNumber,
    this.karanName,
    this.special,
    this.deity,
  });

  var karanNumber;
  var karanName;
  var special;
  var deity;

  factory KaranDetails.fromJson(Map<String, dynamic> json) => KaranDetails(
        karanNumber: json["karan_number"],
        karanName: json["karan_name"],
        special: json["special"],
        deity: json["deity"],
      );

  Map<String, dynamic> toJson() => {
        "karan_number": karanNumber,
        "karan_name": karanName,
        "special": special,
        "deity": deity,
      };
}

class EndTime {
  EndTime({
    this.hour,
    this.minute,
    this.second,
  });

  var hour;
  var minute;
  var second;

  factory EndTime.fromJson(Map<String, dynamic> json) => EndTime(
        hour: json["hour"],
        minute: json["minute"],
        second: json["second"],
      );

  Map<String, dynamic> toJson() => {
        "hour": hour,
        "minute": minute,
        "second": second,
      };
}

class NakShool {
  NakShool({
    this.direction,
    this.remedies,
  });

  var direction;
  var remedies;

  factory NakShool.fromJson(Map<String, dynamic> json) => NakShool(
        direction: json["direction"],
        remedies: json["remedies"],
      );

  Map<String, dynamic> toJson() => {
        "direction": direction,
        "remedies": remedies,
      };
}

class Nakshatra {
  Nakshatra({
    this.details,
    this.endTime,
    this.endTimeMs,
  });

  NakshatraDetails? details;
  EndTime? endTime;
  var endTimeMs;

  factory Nakshatra.fromJson(Map<String, dynamic> json) => Nakshatra(
        details: NakshatraDetails.fromJson(json["details"]),
        endTime: EndTime.fromJson(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toJson() => {
        "details": details!.toJson(),
        "end_time": endTime!.toJson(),
        "end_time_ms": endTimeMs,
      };
}

class NakshatraDetails {
  NakshatraDetails({
    this.nakNumber,
    this.nakName,
    this.ruler,
    this.deity,
    this.special,
    this.summary,
  });

  var nakNumber;
  var nakName;
  var ruler;
  var deity;
  var special;
  var summary;

  factory NakshatraDetails.fromJson(Map<String, dynamic> json) =>
      NakshatraDetails(
        nakNumber: json["nak_number"],
        nakName: json["nak_name"],
        ruler: json["ruler"],
        deity: json["deity"],
        special: json["special"],
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "nak_number": nakNumber,
        "nak_name": nakName,
        "ruler": ruler,
        "deity": deity,
        "special": special,
        "summary": summary,
      };
}

class Tithi {
  Tithi({
    this.details,
    this.endTime,
    this.endTimeMs,
  });

  TithiDetails? details;
  EndTime? endTime;
  var endTimeMs;

  factory Tithi.fromJson(Map<String, dynamic> json) => Tithi(
        details: TithiDetails.fromJson(json["details"]),
        endTime: EndTime.fromJson(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toJson() => {
        "details": details!.toJson(),
        "end_time": endTime!.toJson(),
        "end_time_ms": endTimeMs,
      };
}

class TithiDetails {
  TithiDetails({
    this.tithiNumber,
    this.tithiName,
    this.special,
    this.summary,
    this.deity,
  });

  var tithiNumber;
  var tithiName;
  var special;
  var summary;
  var deity;

  factory TithiDetails.fromJson(Map<String, dynamic> json) => TithiDetails(
        tithiNumber: json["tithi_number"],
        tithiName: json["tithi_name"],
        special: json["special"],
        summary: json["summary"],
        deity: json["deity"],
      );

  Map<String, dynamic> toJson() => {
        "tithi_number": tithiNumber,
        "tithi_name": tithiName,
        "special": special,
        "summary": summary,
        "deity": deity,
      };
}

class Yog {
  Yog({
    this.details,
    this.endTime,
    this.endTimeMs,
  });

  YogDetails? details;
  EndTime? endTime;
  var endTimeMs;

  factory Yog.fromJson(Map<String, dynamic> json) => Yog(
        details: YogDetails.fromJson(json["details"]),
        endTime: EndTime.fromJson(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toJson() => {
        "details": details!.toJson(),
        "end_time": endTime!.toJson(),
        "end_time_ms": endTimeMs,
      };
}

class YogDetails {
  YogDetails({
    this.yogNumber,
    this.yogName,
    this.special,
    this.meaning,
  });

  var yogNumber;
  var yogName;
  var special;
  var meaning;

  factory YogDetails.fromJson(Map<String, dynamic> json) => YogDetails(
        yogNumber: json["yog_number"],
        yogName: json["yog_name"],
        special: json["special"],
        meaning: json["meaning"],
      );

  Map<String, dynamic> toJson() => {
        "yog_number": yogNumber,
        "yog_name": yogName,
        "special": special,
        "meaning": meaning,
      };
}
