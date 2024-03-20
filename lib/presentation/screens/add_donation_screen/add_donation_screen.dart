import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/add_donation_screen/widgets/add_donation_body.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class AddDonationScreen extends StatelessWidget {
  const AddDonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('إضافة تهنئة',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: ColorManager.white),),),
      body: const AddDonationBody(),
    );  }
}
