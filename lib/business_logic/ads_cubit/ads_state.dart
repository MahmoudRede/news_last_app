part of 'ads_cubit.dart';

@immutable
abstract class AdsState {}

class AdsInitial extends AdsState {}
class AdsImagePickerLoadingState extends AdsState {}
class AdsImagePickerSuccessState extends AdsState {}
class AdsImagePickerFailureState extends AdsState {}
class RemoveAdsImageState extends AdsState {}
class UploadAdsImageLoadingState extends AdsState {}
class UploadAdsImageSuccessState extends AdsState {}
class UploadAdsImageFailureState extends AdsState {}
class AddAdsLoadingState extends AdsState {}
class AddAdsSuccessState extends AdsState {}
class AddAdsFailureState extends AdsState {}
class GetAdsLoadingState extends AdsState {}
class GetAdsSuccessState extends AdsState {}
class GetAdsFailureState extends AdsState {
  final String error;
  GetAdsFailureState(this.error);
}
