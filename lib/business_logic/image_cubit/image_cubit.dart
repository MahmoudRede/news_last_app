import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/data/models/news_image_model.dart';

import '../../presentation/widgets/custom_toast.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  static ImageCubit get(context) => BlocProvider.of(context);

  var picker = ImagePicker();
  File? image;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(ImagePickerSuccessState());
    } else {
      print('No image selected');
      emit(ImagePickerFailureState());
    }
  }

  void removeImage() {
    image = null;
    emit(RemovePickedImageSuccessState());
  }

  List<NewsImageModel> images = [];

  void uploadImage(context) {
    emit(UploadImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        debugPrint(AppCubit.get(context).userModel!.uId);
        print(value.toString());
        addImage(image: value,context: context);
        emit(UploadImageSuccessState());
        return customToast(
            title: 'لقد تم رفع الصورة وسوف يتم التأكد منها قبل عرضها',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(UploadImageFailureState());
        debugPrint(error.toString());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    }).catchError((error) {
      emit(UploadImageFailureState());
      debugPrint(error.toString());
      return customToast(
          title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
    });
  }

  void addImage({required String image, required BuildContext context}) {
    NewsImageModel model =
        NewsImageModel(image: image, uId: AppCubit.get(context).userModel!.uId);
    FirebaseFirestore.instance
        .collection('images')
        .add(model.toMap())
        .then((value) {
      emit(AddImageSuccessState());
    }).catchError((error) {
      emit(AddImageFailureState());
    });
  }

  void getImages() {
    emit(GetImageLoadingState());
    FirebaseFirestore.instance.collection('images').get().then((value) {
      for (var doc in value.docs) {
        final image = NewsImageModel.fromJson(doc.data());
        images.add(image);
      }
      emit(GetImageSuccessState());
    }).catchError((error) {
      emit(GetImageFailureState(error));
    });
  }
}
