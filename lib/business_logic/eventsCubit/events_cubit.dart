import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_states.dart';
import 'package:news_last_app/presentation/screens/addEventScreen/models/Event_item_model.dart';
import 'package:news_last_app/presentation/widgets/custom_toast.dart';



class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());

  static EventsCubit get(context) => BlocProvider.of(context);

  var picker = ImagePicker();
  File? eventImage;

  Future<void> pickImage() async {
    emit(EventsImagePickerLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      eventImage = File(pickedFile.path);
      emit(EventsImagePickerSuccessState());
    } else {
      print('No image selected');
      emit(EventsImagePickerFailureState());
    }
  }

  void removeImage() {
    eventImage = null;
    emit(RemoveEventsImageState());
  }

  List<EventItemModel> events = [];

  void uploadEventImage({
    required String title,
  }) {
    emit(UploadEventsImageLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('events/${Uri.file(eventImage!.path).pathSegments.last}')
        .putFile(eventImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        debugPrint(value.toString());
        addEventPost(title: title, image: value);
        emit(UploadEventsImageSuccessState());
        return customToast(
            title: 'لقد تم رفع المناسبة',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(UploadEventsImageFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    }).catchError((error) {
      emit(UploadEventsImageFailureState());
      return customToast(
          title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
    });
  }

  void addEventPost({
    required String title,
    String? image,
  }) {
    if (eventImage == null) {
      EventItemModel model = EventItemModel(title: title, image: "");
      FirebaseFirestore.instance
          .collection('Events')
          .add(model.toMap())
          .then((value) {
        emit(AddEventsSuccessState());
        return customToast(
            title: 'لقد تم رفع المناسبة',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(AddEventsFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    } else {
      EventItemModel model = EventItemModel(image: image, title: title);
      FirebaseFirestore.instance
          .collection('events')
          .add(model.toMap())
          .then((value) {
        emit(AddEventsSuccessState());
        return customToast(
            title: 'لقد تم رفع المناسبة',
            color: Colors.green.shade700);
      }).catchError((error) {
        emit(AddEventsFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    }
  }

  void getEvents() {
    emit(GetEventsLoadingState());
    FirebaseFirestore.instance.collection('Events').get().then((value) {
      for (var doc in value.docs) {
        final eventItem = EventItemModel.fromJson(doc.data());
        events.add(eventItem);
      }
      emit(GetEventsSuccessState());
    }).catchError((error) {
      emit(GetEventsFailureState(error));
    });
  }
}
