class ImageModel {
  String? image,uId;

  ImageModel(
      {required this.image,this.uId});

  ImageModel.fromJson(Map<String, dynamic> json) {
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
