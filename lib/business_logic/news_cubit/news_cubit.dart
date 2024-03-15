import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../presentation/screens/home_screen/models/news_item_model.dart';

part '../../../../business_logic/news_cubit/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  var picker = ImagePicker();
  File? newsImage;
/////
  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      newsImage = File(pickedFile.path);
      emit(ImagePickerSuccessState());
    } else {
      print('No image selected');
      emit(ImagePickerFailureState());
    }
  }

  void removeImage() {
    newsImage = null;
    emit(RemovePostImageState());
  }

  List<NewsItemModel> news = [];

  void uploadPostImage({
    required String headline,
    required String details,
  }) {
    emit(UploadImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('news/${Uri.file(newsImage!.path).pathSegments.last}')
        .putFile(newsImage!)
        .then((value) {
      value.ref.getDownloadURL()
          .then((value)
      {
        print(value.toString());
        addNewsPost(headline: headline, details: details, image: value);
        emit(UploadImageSuccessState());
      })
          .catchError((error)
      {
        emit(UploadImageFailureState());
      });
    }).catchError((error)
    {
      emit(UploadImageFailureState());
    });
  }


  void addNewsPost({
    required String headline,
    required String details,
    required String image,
  }) {
    NewsItemModel model =
        NewsItemModel(image: image, headline: headline, details: details);
    FirebaseFirestore.instance
        .collection('news')
        .add(model.toMap())
        .then((value) {
      emit(AddNewsSuccessState());
    }).catchError((error) {
      emit(AddNewsFailureState());
    });
  }

  void getNews()
  {
    FirebaseFirestore.instance
        .collection('news')
        .get()
        .then((value)
    {
      value.docs.forEach((doc) {
        news.add(NewsItemModel.fromJson(doc.data()));
      });
      emit(GetNewsSuccessState());
    })
        .catchError((error)
    {
      emit(GetNewsFailureState(error));
    });
  }

}
