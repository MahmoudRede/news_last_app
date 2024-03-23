import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/my_profile_view/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SettingsViewBody(),
    );
  }
}
