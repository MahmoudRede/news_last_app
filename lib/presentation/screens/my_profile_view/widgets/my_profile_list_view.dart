import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/presentation/screens/my_profile_view/widgets/settings_view.dart';

import '../../Login_screen/login_screen.dart';
import '../data/my_profile_item_model.dart';
import 'my_profile_list_view_item.dart';

class MyProfileListView extends StatelessWidget {
  const MyProfileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        final List<MyProfileItemModel> items = [
          MyProfileItemModel(
              icon: Icons.settings_outlined,
              title: 'الاعدادات',
                  () => customPushNavigator(context, const SettingsView())),
          MyProfileItemModel(
              icon: Icons.star_border_outlined, title: 'قيم تطبيقنا', () => null),
          MyProfileItemModel(icon: Icons.share, title: 'شارك تطبيقنا', () => null),
          MyProfileItemModel(
              icon: Icons.logout, title: 'تسجيل الخروج', () => cubit.logout(context) ),
        ];
        return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return MyProfileListViewItem(myProfileItemModel: items[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                indent: 30,
                endIndent: 30,
                height: 10,
                thickness: 0.8,
              );
            },
            itemCount: items.length);
      },
    );
  }
  
}
