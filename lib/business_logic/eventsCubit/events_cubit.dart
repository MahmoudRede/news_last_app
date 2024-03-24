import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_states.dart';
import 'package:news_last_app/core/local/shared_preference.dart';
import 'package:news_last_app/presentation/screens/addDeathScreen/model/death_model.dart';
import 'package:news_last_app/presentation/screens/addEventScreen/models/Event_item_model.dart';
import 'package:news_last_app/presentation/widgets/custom_toast.dart';



class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());

  static EventsCubit get(context) => BlocProvider.of(context);

  var eventTitleController = TextEditingController();

  var deathPersonNameController = TextEditingController();
  var deathPersonAgeController = TextEditingController();
  var deathDateController = TextEditingController();
  var deathLocationController = TextEditingController();
  var deathTimeAndLocationController = TextEditingController();
  var deathMenLocationController = TextEditingController();
  var deathMenPhoneController = TextEditingController();
  var deathWomenLocationController = TextEditingController();
  var deathWomenPhoneController = TextEditingController();


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
      EventItemModel model = EventItemModel(userName: UserDataFromStorage.firstNameFromStorage, imageUrl: "", title: title, image: "");
      FirebaseFirestore.instance
          .collection('Events')
          .add(model.toMap())
          .then((value) {
        customToast(
            title: 'لقد تم رفع المناسبة',
            color: Colors.green.shade700);
        eventTitleController.clear();
        emit(AddEventsSuccessState());
      }).catchError((error) {
        emit(AddEventsFailureState());
        return customToast(
            title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
      });
    } else {
      EventItemModel model = EventItemModel(userName: UserDataFromStorage.firstNameFromStorage, imageUrl: "",image: image, title: title);
      FirebaseFirestore.instance
          .collection('events')
          .add(model.toMap())
          .then((value) {
        emit(AddEventsSuccessState());
        eventImage = null;
        eventTitleController.clear();
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
    FirebaseFirestore.instance.collection('events').snapshots().listen((value) {
      events = [];
      for (var doc in value.docs) {
        final eventItem = EventItemModel.fromJson(doc.data());
        events.add(eventItem);
      }
      events = events.reversed.toList();
      debugPrint("Get Events ========>> ${events.length}");
      emit(GetEventsSuccessState());
    });
  }


  DateTime selectedDate = DateTime.now();

  void selectDate(DateTime picked) {
    if (picked != null && picked != selectedDate){
      selectedDate = picked;
      deathDateController.text = DateFormat('EEEE  dd - MM - yyyy', 'ar').format(selectedDate);
      emit(SelectedDateState());
    }
  }


  Future<void> addDeathEvent() async{

    DeathModel deathModel = DeathModel(
        personName: deathPersonNameController.text,
        personAge: deathPersonAgeController.text,
        date: deathDateController.text,
        location: deathLocationController.text,
        timeAndLocation: deathTimeAndLocationController.text,
        menLocation: deathMenLocationController.text,
        menPhone: deathMenPhoneController.text,
        womanLocation: deathWomenLocationController.text,
        womanPhone: deathWomenPhoneController.text
    );

    emit(AddDeathEventLoadingState());
    FirebaseFirestore.instance
        .collection('deaths')
        .add(deathModel.toMap())
        .then((value) {
      emit(AddDeathEventSuccessState());
      deathPersonNameController.clear();
      deathPersonAgeController.clear();
      deathDateController.clear();
      deathTimeAndLocationController.clear();
      deathMenLocationController.clear();
      deathMenPhoneController.clear();
      deathWomenLocationController.clear();
      deathWomenPhoneController.clear();
      return customToast(
          title: 'لقد تم رفع الوفاة',
          color: Colors.green.shade700);
    }).catchError((error) {
      emit(AddDeathEventFailureState());
      debugPrint("Error when add death event ========>> ${error.toString()}");
      return customToast(title: 'يرجي المحاوله  في وقت  لاحق', color: Colors.red.shade700);
    });

  }


  List<DeathModel> deaths = [];
  void getDeaths() {

    emit(GetDeathEventLoadingState());
    FirebaseFirestore.instance.collection('deaths').snapshots().listen((value) {
      deaths = [];
      for (var doc in value.docs) {
        final deathItem = DeathModel.fromJson(doc.data());
        deaths.add(deathItem);
      }
      deaths.sort((a, b) => b.date.compareTo(a.date));
      debugPrint("Get Deaths Events ========>> ${deaths.length}");
      emit(GetDeathEventSuccessState());

    });
  }



}
