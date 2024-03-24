class DeathModel {
  final String personName;
  final String personAge;
  final String date;
  final String location;
  final String timeAndLocation;
  final String menLocation;
  final String menPhone;
  final String womanLocation;
  final String womanPhone;

  DeathModel({
    required this.personName,
    required this.personAge,
    required this.date,
    required this.timeAndLocation,
    required this.menLocation,
    required this.menPhone,
    required this.womanLocation,
    required this.womanPhone,
    required this.location
  });

  factory DeathModel.fromJson(Map<String, dynamic> json) => DeathModel(
    personName: json['personName']??"",
    personAge: json['personAge']??"",
    date: json['date']??"",
    location: json['location']??"",
    timeAndLocation: json['timeAndLocation']??"",
    menLocation: json['menLocation']??"",
    menPhone: json['menPhone']??"",
    womanLocation: json['womanLocation']??"",
    womanPhone: json['womanPhone']??"",
  );

  Map<String, dynamic> toMap() {
    return {
      "personName": personName,
      "personAge": personAge,
      "date": date,
      "location": location,
      "timeAndLocation": timeAndLocation,
      "menLocation": menLocation,
      "menPhone": menPhone,
      "womanLocation": womanLocation,
      "womanPhone": womanPhone,
    };
  }
}