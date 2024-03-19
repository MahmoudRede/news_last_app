import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:news_last_app/presentation/screens/home_screen/models/image_model.dart';

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

  List<ImageModel> images = [];

  void uploadImage() {
    emit(UploadImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value.toString());
        addImage(image: value);
        emit(UploadImageSuccessState());
        return customToast(
            title: 'لقد تم رفع الصورة وسوف يتم التأكد منها قبل عرضها',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(UploadImageFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    }).catchError((error) {
      emit(UploadImageFailureState());
      return customToast(
          title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
    });
  }

  void addImage({
    required String image,
  }) {
    ImageModel model = ImageModel(image: image);
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
    FirebaseFirestore.instance.collection('images').get().then((value) {
      for (var doc in value.docs) {
        final image = ImageModel.fromJson(doc.data());
        images.add(image);
      }
      emit(GetImageSuccessState());
    }).catchError((error) {
      emit(GetImageFailureState(error));
    });
  }



}
