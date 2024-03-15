import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/presentation/screens/add_view/manager/news_cubit.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/news_item.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.get(context);
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return  NewsItem(newsItemModel: cubit.news[index],);
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: cubit.news.length);
      },
    );
  }
}
