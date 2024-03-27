class AdsImageModel {
  String? image,uId;

  AdsImageModel(
      {required this.image,this.uId});

  AdsImageModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'uId': uId,

    };
  }
}
