class EventItemModel {
  String? image, title, userName, imageUrl, date;

  EventItemModel(
      {this.image, required this.title, this.userName, this.imageUrl, this.date});

  EventItemModel.fromJson(Map<String, dynamic> json) {
    image = json['image']??"";
    title = json['title']??"";
    userName = json['userName']??"";
    imageUrl = json['imageUrl']??"";
    date = json['date']??"";
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image??"",
      'title': title??"",
      'userName': userName??"",
      'imageUrl': imageUrl??"",
      'date': date
    };
  }
}
