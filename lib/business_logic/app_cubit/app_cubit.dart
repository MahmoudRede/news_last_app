import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_last_app/constants/firebase_errors.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/data/models/dawina_model.dart';
import 'package:news_last_app/data/models/donation_model.dart';
import 'package:news_last_app/data/models/thanks_model.dart';
import 'package:news_last_app/data/models/user_model.dart';
import 'package:news_last_app/presentation/widgets/custom_toast.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';
import 'package:video_player/video_player.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  ////sign up////
  void createAccountWithFirebaseAuth(
      {required String password,
      required String name,
      required String emailAddress,
      required String phoneNumber,
      required BuildContext context}) async {
    try {
      emit(SignUpLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: '${phoneNumber}@gmail.com',
        password: password,
      );

      await saveUser(
        name: name,
        emailAddress: emailAddress,
        id: (credential.user?.uid)!,
        phoneNumber: '',
      ).then((value) {
        getUser(id: (credential.user?.uid)!);
        CashHelper.saveData(key: 'isUid', value: credential.user?.uid);
        customToast(
          title: "تم التسجيل بنجاح",
          color: Colors.green.shade700,
        );
        emit(SignUpSuccessState());
        debugPrint("--------------Account Created");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
      } else if (CashHelper.getData(key: 'isUid') != null) {
        customToast(
          title: "المستخدم موجود مسبقا",
          color: ColorManager.red,
        );
        emit(SignUpErrorState(e.toString()));
        debugPrint("--------------Failed To Create Account");
      }
    }
  }

  //// login ////
  Future<void> loginWithFirebaseAuth(
      {required BuildContext context,
      required String emailAddress,
      required String password}) async {
    try {
      emit(LoginLoadingState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '${emailAddress}@gmail.com',
        password: password,
      );
      await getUser(id: (credential.user?.uid)!);
      UserModel? user = await readUserFromFireStore(credential.user?.uid ?? "");
      if (user != null) {
        CashHelper.saveData(key: 'isUid', value: credential.user?.uid);
        await getUser(id: (credential.user?.uid)!);
        emit(LoginSuccessState());
        debugPrint(CashHelper.getData(key: 'isUid'));
        debugPrint("-----------Login Successfully");
        return customToast(
            title: "تم تسجيل الدخول بنجاح", color: Colors.green.shade700);
      } else {
        return customToast(title: "خطأ في التسجيل", color: Colors.red.shade700);
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(e.toString()));
      debugPrint("-----------Login Failed");

      customToast(title: "خطأ في التسجيل", color: ColorManager.red);
    } catch (e) {
      customToast(title: 'حدث خطأ  في التسجيل$e', color: ColorManager.red);
    }
  }

  //// Save User ////
  Future<void> saveUser({
    required String name,
    required String phoneNumber,
    required String emailAddress,
    required String id,
  }) async {
    emit(SaveUserLoadingState());

    UserModel userModel = UserModel(
      userName: name,
      phoneNumber: phoneNumber,
      emailAddress: emailAddress,
      uId: id,
    );

    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel.uId)
        .set(userModel.toJson())
        .then((value) {
      debugPrint('Save User Success');
      emit(SaveUserSuccessState());
    }).catchError((error) {
      debugPrint('Error in user Register is ${error.toString()}');
      emit(SaveUserErrorState(error.toString()));
    });
  }

  //// get user ////
  UserModel? userModel;

  Future<void> getUser({required String id}) async {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(id).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      debugPrint(userModel!.userName);
      debugPrint(userModel!.phoneNumber);
      debugPrint('here');
      emit(GetUserSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUserErrorState());
    });
  }

  //// User Reference////

  CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  //// read user ////

  Future<UserModel?> readUserFromFireStore(String id) async {
    DocumentSnapshot<UserModel> user = await getUsersCollection().doc(id).get();
    var myUser = user.data();
    return myUser;
  }

  /// toggle between home tabs
  int selectedIndex = 0;

  void changeHomeTabs(int index) {
    selectedIndex = index;
    if (selectedIndex == 5) {
      getThanksPosts();
      getDonationPosts();
    }
    emit(ChangeHomeTabsState());
  }

  int eventsIndex = 0;

  void changeEventsTabs(int index) {
    eventsIndex = index;
    emit(ChangeEventsTabsState());
  }

  /// get thanks image
  var picker = ImagePicker();
  File? thanksImage;
  String thanksImageUrl = '';

  Future<void> getThanksImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      thanksImage = File(pickedFile.path);
      emit(GetThanksImagePickerSuccessState());
    } else {
      debugPrint('No image selected');
      emit(GetThanksImagePickerErrorState());
    }
  }

  /// upload thanks image
  Future<void> uploadThanksImage() async {
    emit(UploadThanksImageLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('Thanks/${Uri.file(thanksImage!.path).pathSegments.last}')
        .putFile(thanksImage!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        thanksImageUrl = value;
        emit(UploadThanksImageSuccessState());
      }).catchError((error) {
        emit(UploadThanksImageErrorState());
      });
    });
  }

  /// upload thanks posts

  Future<void> uploadThanks({
    required String personName,
    required String messageTitle,
    required String messageBody,
    String? image,
  }) async {
    emit(UploadThanksLoadingState());
    final thanksModel = ThanksModel(
      personName: personName,
      title: messageTitle,
      message: messageBody,
      imagePath: image,
      uId: userModel!.uId!,
    );
    FirebaseFirestore.instance
        .collection('Thanks')
        .add(thanksModel.toJson())
        .then((value) {
      emit(UploadThanksSuccessState());
    }).catchError((error) {
      emit(UploadThanksErrorState());
    });
  }

  /// get thanks posts
  List<ThanksModel> thanksList = [];

  Future<void> getThanksPosts() async {
    thanksList = [];
    emit(GetThanksLoadingState());
    await FirebaseFirestore.instance.collection('Thanks').get().then((value) {
      debugPrint("value.docs.length is *********** ${value.docs.last.data()}");
      value.docs.forEach((element) {
        var thanksModel = ThanksModel.fromJson(element.data());
        thanksList.add(thanksModel);
      });
      debugPrint("thanksList is *********** ${thanksList[0].personName}");
      emit(GetThanksSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(GetThanksErrorState());
    });
  }

  /// upload donation

  Future<void> uploadDonation({required String messageBody}) async {
    emit(UploadDonationLoadingState());
    final donationModel = DonationModel(
      content: messageBody,
      id: userModel!.uId!,
    );
    FirebaseFirestore.instance
        .collection('Donations')
        .add(donationModel.toJson())
        .then((value) {
      emit(UploadDonationSuccessState());
    }).catchError((error) {
      emit(UploadDonationErrorState());
    });
  }

  List<DonationModel> donationList = [];

  Future<void> getDonationPosts() async {
    donationList = [];
    emit(GetDonationsLoadingState());
    await FirebaseFirestore.instance
        .collection('Donations')
        .get()
        .then((value) {
      debugPrint("value.docs.length is *********** ${value.docs.last.data()}");
      value.docs.forEach((element) {
        var donationModel = DonationModel.fromJson(element.data());
        donationList.add(donationModel);
      });
      debugPrint("donationList is *********** ${donationList[0].content}");
      emit(GetDonationsSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(GetDonationsErrorState());
    });
  }

  ///Video

  List<String> videoPaths = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  List<VideoPlayerController> videoControllers = List.generate(
      10,
      (index) => VideoPlayerController.networkUrl(Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')));
  late VideoPlayerController videoController;

  Future<void> initialVideo(context) async {
    emit(InitialVideoLoadingState());
    AppCubit.get(context).videoPaths.forEach((element) {
      videoController = VideoPlayerController.networkUrl(Uri.parse(element))
        ..initialize().then((value) {
          debugPrint('video loaded');
          emit(InitialVideoSuccessState());
        }).catchError((error) {
          debugPrint('Error in video ${error.toString()}');
          emit(InitialVideoErrorState());
        });
    });
  }

  void videoIsPlay() {
    videoController.value.isPlaying
        ? videoController.pause()
        : videoController.play();
    emit(InitialVideoSuccessState());
  }

  Future<void> addDawina({
    required String itemName,
    required String address,
    required String days,
    required String phone,
    required String location,
  }) async {
    emit(UploadDawinaLoadingState());
    DawinaModel dawinaModel = DawinaModel(
        itemName: itemName,
        address: address,
        days: days,
        uId: '',
        phone: phone,
        location: location);

    FirebaseFirestore.instance
        .collection('dawina')
        .add(dawinaModel.toJson())
        .then((value) {
      FirebaseFirestore.instance
          .collection('dawina')
          .doc(value.id)
          .update({'uId': value.id});

      customToast(
          title: 'تم اضافه الدوانيه بنجاح', color: ColorManager.primaryColor);
      debugPrint('Upload Dawina Success');
      emit(UploadDawinaSuccessState());
    }).catchError((error) {
      debugPrint('Error in Add Dawina is ${error.toString()}');
      emit(UploadDawinaErrorState());
    });
  }

  List<DawinaModel> dawinaList = [];

  Future<void> getDawina() async {
    dawinaList = [];
    emit(GetDawinaLoadingState());

    FirebaseFirestore.instance.collection('dawina').get().then((value) {
      for (var element in value.docs) {
        dawinaList.add(DawinaModel.fromJson(element.data()));
      }

      debugPrint('Get Dawina Success');
      emit(GetDawinaSuccessState());
    }).catchError((error) {
      debugPrint('Error in Add Dawina is ${error.toString()}');
      emit(GetDawinaErrorState());
    });
  }

  /// UPDATE USER
  void updateUser({
    required String name,
    required String phone,
  }) {
    emit(UpdateProfileLoadingState());
    UserModel model = UserModel(
        userName: name,
        phoneNumber: userModel!.phoneNumber,
        emailAddress: userModel!.emailAddress,
        uId: userModel!.phoneNumber);
    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel!.uId)
        .update(model.toJson())
        .then((value) async {
      customToast(
          title: 'Profile Updated successfully',
          color: ColorManager.primaryColor);
      emit(UpdateProfileSuccessState());
      getUser(id: userModel!.uId!);
    }).catchError((error) {
      var index = (error.toString()).indexOf(']');
      String showError = (error.toString()).substring(index + 1);
      customToast(title: showError, color: ColorManager.primaryColor);
      debugPrint(error);
      emit(UpdateProfileErrorState(error));
    });
  }
}
