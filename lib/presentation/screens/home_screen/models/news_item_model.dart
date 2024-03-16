class NewsItemModel {
  String? image, headline, details;

  NewsItemModel(
      {this.image, required this.headline, required this.details});

  NewsItemModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    headline = json['headline'];
    details = json['details'];
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'headline': headline,
      'details': details,
    };
  }
}
