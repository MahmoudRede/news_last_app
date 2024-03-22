class EventItemModel {
  String? image, title;

  EventItemModel(
      {this.image, required this.title});

  EventItemModel.fromJson(Map<String, dynamic> json) {
    image = json['image']??"";
    title = json['title']??"";
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image??"",
      'title': title??"",
    };
  }
}
