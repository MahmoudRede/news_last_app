import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/add_thanks_screen/widgets/add_thanks_body.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class AddThanksScreen extends StatelessWidget {
  const AddThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('إضافة شُكر',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: ColorManager.white),),),
      body: const AddThanksBody(),
    );
  }
}
