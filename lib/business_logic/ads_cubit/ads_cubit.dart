import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../data/models/ads_item_model.dart';
import '../../presentation/widgets/custom_toast.dart';
import '../app_cubit/app_cubit.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit() : super(AdsInitial());

  static AdsCubit get(context) => BlocProvider.of(context);

  var picker = ImagePicker();
  File? adsImage;

  Future<void> pickImage() async {
    emit(AdsImagePickerLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      adsImage = File(pickedFile.path);
      emit(AdsImagePickerSuccessState());
    } else {
      print('No image selected');
      emit(AdsImagePickerFailureState());
    }
  }

  void removeImage() {
    adsImage = null;
    emit(RemoveAdsImageState());
  }

  List<AdsItemModel> ads = [];

  void uploadAdsImage({
    required String headline,
    required String details,
    context
  }) {
    emit(UploadAdsImageLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('ads/${Uri.file(adsImage!.path).pathSegments.last}')
        .putFile(adsImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        debugPrint(value.toString());
        addAdsPost(headline: headline, details: details, image: value,context: context);
        emit(UploadAdsImageSuccessState());
        return customToast(
            title: 'لقد تم رفع الخبر وسوف يتم التأكد منه قبل عرضه',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(UploadAdsImageFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    }).catchError((error) {
      emit(UploadAdsImageFailureState());
      return customToast(
          title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
    });
  }

  void addAdsPost(
      {required String headline,
        required String details,
        String? image,
        required BuildContext context}) {
    emit(AddAdsLoadingState());
    if (adsImage == null) {
      AdsItemModel model = AdsItemModel(
          headline: headline,
          details: details,
          uId: AppCubit.get(context).userModel!.uId);
      FirebaseFirestore.instance
          .collection('ads')
          .add(model.toMap())
          .then((value) {
        emit(AddAdsSuccessState());
        return customToast(
            title: 'لقد تم رفع الإعلان وسوف يتم التأكد منه قبل عرضه',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(AddAdsFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    } else {
      AdsItemModel model = AdsItemModel(
          image: image,
          headline: headline,
          details: details,
          uId: AppCubit.get(context).userModel!.uId);
      FirebaseFirestore.instance
          .collection('ads')
          .add(model.toMap())
          .then((value) {
        emit(AddAdsSuccessState());
        return customToast(
            title: 'لقد تم رفع الإعلان وسوف يتم التأكد منه قبل عرضه',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(AddAdsFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    }
  }

  void getAds() {
    emit(GetAdsLoadingState());
    FirebaseFirestore.instance.collection('ads').get().then((value) {
      for (var doc in value.docs) {
        final adsItem = AdsItemModel.fromJson(doc.data());
        ads.add(adsItem);
      }
      emit(GetAdsSuccessState());
    }).catchError((error) {
      emit(GetAdsFailureState(error));
    });
  }
}

