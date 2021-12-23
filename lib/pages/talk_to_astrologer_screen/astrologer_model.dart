// To parse this JSON data, do
//
//     final astrologerModel = astrologerModelFromJson(jsonString);

import 'dart:convert';

AstrologerModel astrologerModelFromJson(String str) =>
    AstrologerModel.fromJson(json.decode(str));

String astrologerModelToJson(AstrologerModel data) =>
    json.encode(data.toJson());

class AstrologerModel {
  AstrologerModel({
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
  List<Datum>? data;

  factory AstrologerModel.fromJson(Map<String, dynamic> json) =>
      AstrologerModel(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.urlSlug,
    this.namePrefix,
    this.firstName,
    this.lastName,
    this.aboutMe,
    this.profliePicUrl,
    this.experience,
    this.languages,
    this.minimumCallDuration,
    this.minimumCallDurationCharges,
    this.additionalPerMinuteCharges,
    this.isAvailable,
    this.rating,
    this.skills,
    this.isOnCall,
    this.freeMinutes,
    this.additionalMinute,
    this.images,
    this.availability,
  });

  var id;
  var urlSlug;
  var namePrefix;
  var firstName;
  var lastName;
  var aboutMe;
  var profliePicUrl;
  var experience;
  List<Language>? languages;
  var minimumCallDuration;
  var minimumCallDurationCharges;
  var additionalPerMinuteCharges;
  var isAvailable;
  var rating;
  List<Skill>? skills;
  var isOnCall;
  var freeMinutes;
  var additionalMinute;
  Images? images;
  Availability? availability;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        urlSlug: json["urlSlug"],
        namePrefix: json["namePrefix"] == null ? null : json["namePrefix"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        aboutMe: json["aboutMe"] == null ? null : json["aboutMe"],
        profliePicUrl: json["profliePicUrl"],
        experience: json["experience"],
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        minimumCallDuration: json["minimumCallDuration"],
        minimumCallDurationCharges: json["minimumCallDurationCharges"],
        additionalPerMinuteCharges: json["additionalPerMinuteCharges"],
        isAvailable: json["isAvailable"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        isOnCall: json["isOnCall"],
        freeMinutes: json["freeMinutes"],
        additionalMinute: json["additionalMinute"],
        images: Images.fromJson(json["images"]),
        availability: json["availability"] == null
            ? null
            : Availability.fromJson(json["availability"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urlSlug": urlSlug,
        "namePrefix": namePrefix == null ? null : namePrefix,
        "firstName": firstName,
        "lastName": lastName,
        "aboutMe": aboutMe == null ? null : aboutMe,
        "profliePicUrl": profliePicUrl,
        "experience": experience,
        "languages": List<dynamic>.from(languages!.map((x) => x.toJson())),
        "minimumCallDuration": minimumCallDuration,
        "minimumCallDurationCharges": minimumCallDurationCharges,
        "additionalPerMinuteCharges": additionalPerMinuteCharges,
        "isAvailable": isAvailable,
        "rating": rating == null ? null : rating,
        "skills": List<dynamic>.from(skills!.map((x) => x.toJson())),
        "isOnCall": isOnCall,
        "freeMinutes": freeMinutes,
        "additionalMinute": additionalMinute,
        "images": images!.toJson(),
        "availability": availability == null ? null : availability!.toJson(),
      };
}

class Availability {
  Availability({
    this.days,
    this.slot,
  });

  List<Day>? days;
  Slot? slot;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        days: List<Day>.from(json["days"].map((x) => dayValues.map[x])),
        slot: Slot.fromJson(json["slot"]),
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days!.map((x) => dayValues.reverse[x])),
        "slot": slot!.toJson(),
      };
}

enum Day { MON, TUE, WED, THU, FRI, SAT, SUN }

final dayValues = EnumValues({
  "FRI": Day.FRI,
  "MON": Day.MON,
  "SAT": Day.SAT,
  "SUN": Day.SUN,
  "THU": Day.THU,
  "TUE": Day.TUE,
  "WED": Day.WED
});

class Slot {
  Slot({
    this.toFormat,
    this.fromFormat,
    this.from,
    this.to,
  });

  Format? toFormat;
  Format? fromFormat;
  var from;
  var to;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        toFormat: formatValues.map[json["toFormat"]],
        fromFormat: formatValues.map[json["fromFormat"]],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "toFormat": formatValues.reverse[toFormat],
        "fromFormat": formatValues.reverse[fromFormat],
        "from": from,
        "to": to,
      };
}

enum Format { PM, AM }

final formatValues = EnumValues({"AM": Format.AM, "PM": Format.PM});

class Images {
  Images({
    this.small,
    this.large,
    this.medium,
  });

  Large? small;
  Large? large;
  Large? medium;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: Large.fromJson(json["small"]),
        large: Large.fromJson(json["large"]),
        medium: Large.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small!.toJson(),
        "large": large!.toJson(),
        "medium": medium!.toJson(),
      };
}

class Large {
  Large({
    this.imageUrl,
    this.id,
  });

  var imageUrl;
  var id;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl == null ? null : imageUrl,
        "id": id == null ? null : id,
      };
}

class Language {
  Language({
    this.id,
    this.name,
  });

  var id;
  var name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

enum LanguageName { HINDI, ENGLISH }

final languageNameValues =
    EnumValues({"English": LanguageName.ENGLISH, "Hindi": LanguageName.HINDI});

class Skill {
  Skill({
    this.id,
    this.name,
    this.description,
  });

  var id;
  var name;
  var description;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

enum SkillName {
  FALIT_JYOTISH,
  KUNDALI_GRAH_DOSH,
  VASTU,
  ASTROLOGY,
  VEDIC_ASTROLOGY,
  PALMISTRY,
  NUMEROLOGY,
  TAROT,
  FACE_READING,
  COFFE_CUP_READING
}

final skillNameValues = EnumValues({
  "Astrology": SkillName.ASTROLOGY,
  "Coffe Cup Reading": SkillName.COFFE_CUP_READING,
  "Face Reading": SkillName.FACE_READING,
  "Falit Jyotish": SkillName.FALIT_JYOTISH,
  "Kundali Grah Dosh": SkillName.KUNDALI_GRAH_DOSH,
  "Numerology": SkillName.NUMEROLOGY,
  "Palmistry": SkillName.PALMISTRY,
  "Tarot": SkillName.TAROT,
  "Vastu": SkillName.VASTU,
  "Vedic Astrology": SkillName.VEDIC_ASTROLOGY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
