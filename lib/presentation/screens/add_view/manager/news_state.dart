part of 'news_cubit.dart';

@immutable
abstract class NewsState {}
class NewsInitial extends NewsState {}
class ImagePickerSuccessState extends NewsState {}
class ImagePickerFailureState extends NewsState {}
class RemovePostImageState extends NewsState {}
class UploadImageLoadingState extends NewsState {}
class UploadImageSuccessState extends NewsState {}
class UploadImageFailureState extends NewsState {}
class AddNewsLoadingState extends NewsState {}
class AddNewsSuccessState extends NewsState {}
class AddNewsFailureState extends NewsState {}
class GetNewsLoadingState extends NewsState {}
class GetNewsSuccessState extends NewsState {}
class GetNewsFailureState extends NewsState {
  final String error;
  GetNewsFailureState(this.error);
}
