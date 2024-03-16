import 'dart:ui';

class AddPostModel {
  final String image,title;
  final VoidCallback? function;

  const AddPostModel(this.function, {required this.image, required this.title});
}