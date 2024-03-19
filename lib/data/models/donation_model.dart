class DonationModel{
  String? id;
  String? content;

  DonationModel({
    required this.id,
    required this.content,
  });

  DonationModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    content = json['content'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
    };
  }
}