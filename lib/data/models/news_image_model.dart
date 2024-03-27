class NewsImageModel {
  String? image,uId;

  NewsImageModel(
      {required this.image,this.uId});

  NewsImageModel.fromJson(Map<String, dynamic> json) {
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
