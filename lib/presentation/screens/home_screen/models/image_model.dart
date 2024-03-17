class ImageModel {
  String? image;

  ImageModel(
      {required this.image});

  ImageModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,

    };
  }
}
