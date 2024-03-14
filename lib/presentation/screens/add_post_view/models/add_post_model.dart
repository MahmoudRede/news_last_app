class AddPostModel {
  final String image,title;
  final Function()? function;

  const AddPostModel(this.function, {required this.image, required this.title});
}