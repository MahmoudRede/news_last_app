import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/news_item.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const NewsItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: 10);
  }
}
