import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/constants/firebase_errors.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/data/models/user_model.dart';
import 'package:news_last_app/presentation/widgets/custom_toast.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

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
        email: emailAddress,
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
        email: emailAddress,
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
    emit(ChangeHomeTabsState());
  }

  int eventsIndex = 0;
  void changeEventsTabs(int index) {
    eventsIndex = index;
    emit(ChangeEventsTabsState());
  }

}
