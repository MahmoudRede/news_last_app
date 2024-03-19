class ThanksModel {
   String? uId;
   String? personName;
   String? imagePath;
   String? title;
   String? message;

  ThanksModel(
      {required this.uId,
      required this.personName,
      this.imagePath,
      required this.title,
      required this.message});

  ThanksModel.fromJson(Map<String, dynamic> json)
       : uId = json['uId'],
         personName = json['personName'],
         imagePath = json['imagePath'],
         title = json['title'],
         message = json['message'];

   Map<String, dynamic> toJson() {
     return {
       'uId': uId,
       'personName': personName,
       'imagePath': imagePath,
       'title': title,
       'message': message,
     };
   }
}
