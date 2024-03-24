class EventItemModel {
  String? image, title, userName, imageUrl;

  EventItemModel(
      {this.image, required this.title, this.userName, this.imageUrl});

  EventItemModel.fromJson(Map<String, dynamic> json) {
    image = json['image']??"";
    title = json['title']??"";
    userName = json['userName']??"";
    imageUrl = json['imageUrl']??"";
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image??"",
      'title': title??"",
      'userName': userName??"",
      'imageUrl': imageUrl??"",
    };
  }
}
