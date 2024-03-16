class NewsItemModel {
  String? image, headline, details;
  bool? approved;

  NewsItemModel(
      {this.image, required this.headline, required this.details, this.approved = false});

  NewsItemModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    headline = json['headline'];
    details = json['details'];
    approved = json['approved'];
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'headline': headline,
      'details': details,
      'approved' : approved,
    };
  }
}
