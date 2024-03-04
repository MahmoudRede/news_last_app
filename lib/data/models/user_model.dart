class UserModel {
  static const String collectionName = 'Users';

  String? userName;
  String? phoneNumber;
  String? emailAddress;
  String? uId;


  UserModel({
    required this.userName,
    required this.phoneNumber,
    this.emailAddress,
    this.uId,

  });

  UserModel.fromJson(Map<String, dynamic> json) : this(
    userName : json['userName'],
    emailAddress : json['emailAddress'],
    phoneNumber : json['phoneNumber'],
    uId : json['uId'],


  );

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'uId': uId,
    };
  }
}
