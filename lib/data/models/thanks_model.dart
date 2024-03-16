class ThanksModel {
  final String uId;
  final String personName;
  final String imagePath;
  final String title;
  final String message;

  ThanksModel(
      {required this.uId,
      required this.personName,
      this.imagePath = '',
      required this.title,
      required this.message});

  ThanksModel.fromJson(Map<String, dynamic> json, this.uId, this.personName,
      this.imagePath, this.title, this.message) {
    ThanksModel(
      uId: json['uId'],
      personName: json['personName'],
      imagePath: json['imagePath'],
      title: json['title'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'personName': personName,
      'imagePath': imagePath,
      'title': title,
      'message': message,
    };
  }
}
