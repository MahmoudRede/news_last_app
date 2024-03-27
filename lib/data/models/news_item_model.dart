class NewsItemModel {
  String? image, headline, details,uId;
  bool? approved;

  NewsItemModel(
      {this.image, required this.headline, required this.details,this.uId, this.approved = false});

  NewsItemModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    headline = json['headline'];
    details = json['details'];
    approved = json['approved'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'headline': headline,
      'details': details,
      'approved' : approved,
      'uId' : uId,
    };
  }
}
