import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/my_profile_view/widgets/profile_card.dart';

import 'package:news_last_app/styles/color_manager/color_manager.dart';

import 'my_profile_list_view.dart';

class MyProfileViewBody extends StatelessWidget {
  const MyProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfileCard(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          const Expanded(child: MyProfileListView()),
        ],
      ),
    );
  }
}
