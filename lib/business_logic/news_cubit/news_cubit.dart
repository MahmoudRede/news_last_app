import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:news_last_app/presentation/widgets/custom_toast.dart';

import '../../presentation/screens/home_screen/models/news_item_model.dart';

part '../../../../business_logic/news_cubit/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  var picker = ImagePicker();
  File? newsImage;

  Future<void> pickImage() async {
    emit(NewsImagePickerLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      newsImage = File(pickedFile.path);
      emit(NewsImagePickerSuccessState());
    } else {
      print('No image selected');
      emit(NewsImagePickerFailureState());
    }
  }

  void removeImage() {
    newsImage = null;
    emit(RemoveNewsImageState());
  }

  List<NewsItemModel> news = [];

  void uploadNewsImage({
    required String headline,
    required String details,
  }) {
    emit(UploadNewsImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('news/${Uri.file(newsImage!.path).pathSegments.last}')
        .putFile(newsImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value.toString());
        addNewsPost(headline: headline, details: details, image: value);
        emit(UploadNewsImageSuccessState());
        return customToast(
            title: 'لقد تم رفع الخبر وسوف يتم التأكد منه قبل عرضه',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(UploadNewsImageFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    }).catchError((error) {
      emit(UploadNewsImageFailureState());
      return customToast(
          title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
    });
  }

  void addNewsPost({
    required String headline,
    required String details,
    String? image,
  }) {
    if (newsImage == null) {
      NewsItemModel model = NewsItemModel(headline: headline, details: details);
      FirebaseFirestore.instance
          .collection('news')
          .add(model.toMap())
          .then((value) {
        emit(AddNewsSuccessState());
        return customToast(
            title: 'لقد تم رفع الخبر وسوف يتم التأكد منه قبل عرضه',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(AddNewsFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    } else {
      NewsItemModel model =
          NewsItemModel(image: image, headline: headline, details: details);
      FirebaseFirestore.instance
          .collection('news')
          .add(model.toMap())
          .then((value) {
        emit(AddNewsSuccessState());
        return customToast(
            title: 'لقد تم رفع الخبر وسوف يتم التأكد منه قبل عرضه',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(AddNewsFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    }
  }

  void getNews() {
    emit(GetNewsLoadingState());
    FirebaseFirestore.instance.collection('news').get().then((value) {
      for (var doc in value.docs) {
        final newsItem = NewsItemModel.fromJson(doc.data());
        news.add(newsItem);
      }
      emit(GetNewsSuccessState());
    }).catchError((error) {
      emit(GetNewsFailureState(error));
    });
  }
}
