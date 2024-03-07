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

