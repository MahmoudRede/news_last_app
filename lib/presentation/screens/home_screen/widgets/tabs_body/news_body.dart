import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/ads_cubit/ads_cubit.dart';
import 'package:news_last_app/constants/shimmer.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/news_item.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/ads_items.dart';

import '../../../../../business_logic/news_cubit/news_cubit.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    NewsCubit newsCubit = NewsCubit.get(context);
    AdsCubit adsCubit = AdsCubit.get(context);
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final newsItem = newsCubit.news[index];
            bool hasImage = newsItem.image != null && newsItem.image!.isNotEmpty;
            return hasImage
                ? NewsItemWithImage(newsItemModel: newsItem)
                : NewsItem(newsItemModel: newsItem);
          },
          separatorBuilder: (context, index) {
            return const SizedBox();
            /*if ((index + 1) % 2 == 0 && index != newsCubit.news.length - 1) {
              return BlocBuilder<AdsCubit, AdsState>(
                builder: (context, adsState) {
                  final adsItem = adsCubit.ads[index ~/2];
                  bool hasImage = adsItem.image != null && adsItem.image!.isNotEmpty;
                  return hasImage
                      ? AdsItemWithImage(adsItemModel: adsItem)
                      : AdsItem(adsItemModel: adsItem);
                },
              );
            } else {
              return const SizedBox(); // Otherwise, return an empty SizedBox
            }*/
          }
          ,


          itemCount: newsCubit.news.length,
        );
      },
    );
  }
}
