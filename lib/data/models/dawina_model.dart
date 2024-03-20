class DawinaModel {

  String? itemName;
  String? address;
  String? days;
  String? phone;
  String? location;
  String? uId;


  DawinaModel({
    required this.itemName,
    required this.address,
    required this.days,
    required this.uId,
    required this.phone,
    required this.location,
  });

  DawinaModel.fromJson(Map<String, dynamic> json) : this(
    itemName : json['itemName'],
    address : json['address'],
    days : json['days'],
    uId : json['uId'],
    phone : json['phone'],
    location : json['location'],
  );

  Map<String, dynamic> toJson() {
    return {
      'itemName': itemName,
      'address': address,
      'days': days,
      'uId': uId,
      'phone': phone,
      'location': location,
    };
  }
}
