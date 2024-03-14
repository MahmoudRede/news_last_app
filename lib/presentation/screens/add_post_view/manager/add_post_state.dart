part of 'add_post_cubit.dart';

@immutable
abstract class AddPostState {}

class AddPostInitial extends AddPostState {}
class ImagePickerSuccessState extends AddPostState {}
class ImagePickerFailureState extends AddPostState {}
class UploadImageLoadingState extends AddPostState {}
class UploadImageSuccessState extends AddPostState {}
class UploadImageFailureState extends AddPostState {}
class AddNewsLoadingState extends AddPostState {}
class AddNewsSuccessState extends AddPostState {}
class AddNewsFailureState extends AddPostState {}
