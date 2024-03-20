import 'package:flutter/material.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/presentation/screens/dawina_screen/widgets/dawina_item.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/news_item.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class DawinaScreen extends StatelessWidget {
  const DawinaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return  DawinaItem(dawinaModel: AppCubit.get(context).dawinaList[index],);
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: AppCubit.get(context).dawinaList.length
        ),
          ]
        ),
      ),
    );
  }
}
