import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/news_item.dart';

import '../../../../../business_logic/news_cubit/news_cubit.dart';

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
