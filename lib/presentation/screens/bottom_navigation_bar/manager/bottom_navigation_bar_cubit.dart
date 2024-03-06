import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_last_app/presentation/screens/add_post_view/add_post_view.dart';
import 'package:news_last_app/presentation/screens/events_view/events_view.dart';
import 'package:news_last_app/presentation/screens/favorite_view/favorite_view.dart';
import 'package:news_last_app/presentation/screens/home_screen/home_screen/home_screen.dart';
import 'package:news_last_app/presentation/screens/profile_view/profile_view.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());

  static BottomNavigationBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> views = [
    const HomeView(),
    const FavoriteView(),
    const AddPostView(),
    const EventsView(),
    const ProfileView()
  ];
  List<String> titles = [
    'الرئيسية',
    'المفضلة',
    'اضافة',
    'المناسبات',
    'حسابي',
  ];

  void changeBotNavViews(int index) {
      currentIndex = index;
      emit(BotNavChangeState());
  }
}
