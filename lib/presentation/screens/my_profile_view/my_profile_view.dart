import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/my_profile_view/widgets/my_profile_view_body.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const MyProfileViewBody(),
    );
  }
}
