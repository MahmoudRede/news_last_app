part of 'app_cubit.dart';

 abstract class AppState {}

class AppInitial extends AppState {}
// Sign Up States

class SignUpLoadingState extends AppState {}

class SignUpSuccessState extends AppState {}

class SignUpErrorState extends AppState {
 SignUpErrorState(String error);
}

//Login States

class LoginLoadingState extends AppState {}

class LoginSuccessState extends AppState {}

class LoginErrorState extends AppState {
 LoginErrorState(String error);
}

//Save user
class SaveUserLoadingState extends AppState{}
class SaveUserSuccessState extends AppState{}
class SaveUserErrorState extends AppState{
 SaveUserErrorState(String error);}

//Get User
class GetUserLoadingState extends AppState{}
class GetUserSuccessState extends AppState{}
class GetUserErrorState extends AppState{}

class ChangeHomeTabsState extends AppState{}
class ChangeEventsTabsState extends AppState{}

class InitialVideoLoadingState extends AppState{}
class InitialVideoSuccessState extends AppState{}
class InitialVideoErrorState extends AppState{}

class UploadDawinaLoadingState extends AppState{}
class UploadDawinaSuccessState extends AppState{}
class UploadDawinaErrorState extends AppState{}

class GetDawinaLoadingState extends AppState{}
class GetDawinaSuccessState extends AppState{}
class GetDawinaErrorState extends AppState{}

/// Get Thanks Image Picker
class GetThanksImagePickerLoadingState extends AppState{}
class GetThanksImagePickerSuccessState extends AppState{}
class GetThanksImagePickerErrorState extends AppState{}

/// upload thanks image
class UploadThanksImageLoadingState extends AppState{}
class UploadThanksImageSuccessState extends AppState{}
class UploadThanksImageErrorState extends AppState{}

/// upload Thanks
class UploadThanksLoadingState extends AppState{}
class UploadThanksSuccessState extends AppState{}
class UploadThanksErrorState extends AppState{}

/// Get Thanks
class GetThanksLoadingState extends AppState{}
class GetThanksSuccessState extends AppState{}
class GetThanksErrorState extends AppState{}

/// upload donation
class UploadDonationLoadingState extends AppState{}
class UploadDonationSuccessState extends AppState{}
class UploadDonationErrorState extends AppState{}

/// get donations

class GetDonationsLoadingState extends AppState{}
class GetDonationsSuccessState extends AppState{}
class GetDonationsErrorState extends AppState{}


