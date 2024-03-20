part of 'image_cubit.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}
class ImagePickerSuccessState extends ImageState {}
class ImagePickerFailureState extends ImageState {}
class RemovePickedImageSuccessState extends ImageState {}
class UploadImageLoadingState extends ImageState {}
class UploadImageSuccessState extends ImageState {}
class UploadImageFailureState extends ImageState {}
class AddImageSuccessState extends ImageState {}
class AddImageFailureState extends ImageState {}
class GetImageLoadingState extends ImageState {}
class GetImageSuccessState extends ImageState {}
class GetImageFailureState extends ImageState {
  final String error;

  GetImageFailureState(this.error);
}
