part of 'news_cubit.dart';

@immutable
abstract class NewsState {}
class NewsInitial extends NewsState {}
class NewsImagePickerLoadingState extends NewsState {}
class NewsImagePickerSuccessState extends NewsState {}
class NewsImagePickerFailureState extends NewsState {}
class RemoveNewsImageState extends NewsState {}
class UploadNewsImageLoadingState extends NewsState {}
class UploadNewsImageSuccessState extends NewsState {}
class UploadNewsImageFailureState extends NewsState {}
class AddNewsLoadingState extends NewsState {}
class AddNewsSuccessState extends NewsState {}
class AddNewsFailureState extends NewsState {}
class GetNewsLoadingState extends NewsState {}
class GetNewsSuccessState extends NewsState {}
class GetNewsFailureState extends NewsState {
  final String error;
  GetNewsFailureState(this.error);
}
