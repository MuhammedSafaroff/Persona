class TestRequestModel {
  TestRequestModel({
    this.old,
    this.medication,
    this.about,
    this.happinessLevel,
    this.mentalDisorders,
    this.tellAbout,
    this.sadTime,
    this.lastHoliday,
  });

  int? old;
  bool? medication;
  String? about;
  double? happinessLevel;
  List<String>? mentalDisorders;
  bool? tellAbout;
  String? sadTime;
  DateTime? lastHoliday;

  factory TestRequestModel.fromJson(Map<String, dynamic> json) =>
      TestRequestModel(
        old: json["old"],
        medication: json["medication"],
        about: json["about"],
        happinessLevel: json["happinessLevel"],
        mentalDisorders:
            List<String>.from(json["mentalDisorders"].map((x) => x)),
        tellAbout: json["tellAbout"],
        sadTime: json["sadTime"],
        lastHoliday: json["lastHoliday"],
      );

  Map<String, dynamic> toJson() => {
        "old": old,
        "medication": medication,
        "about": about,
        "happinessLevel": happinessLevel,
        "mentalDisorders": List<dynamic>.from(mentalDisorders!.map((x) => x)),
        "tellAbout": tellAbout,
        "sadTime": sadTime,
        "lastHoliday": lastHoliday,
      };
}
