import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/ads_cubit/ads_cubit.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/news_item.dart';

import '../../../../../business_logic/news_cubit/news_cubit.dart';
import '../ads_items.dart';

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
            // Check if the index is odd and not the last news item
            if (index % 2 == 1 && index != newsCubit.news.length * 2 - 1) {
              return BlocBuilder<AdsCubit, AdsState>(
                builder: (context, adsState) {
                  if (adsState is  GetAdsSuccessState) {
                    // Adjusted index for ads
                    final adsIndex = index ~/ 2;
                    if (adsIndex < adsCubit.ads.length) {
                      final adsItem = adsCubit.ads[adsIndex];
                      bool hasImage = adsItem.image != null && adsItem.image!.isNotEmpty;
                      return hasImage
                          ? AdsItemWithImage(adsItemModel: adsItem)
                          : AdsItem(adsItemModel: adsItem);
                    }else {
                      // Repeat the ads if adsIndex exceeds the number of ads
                      final repeatedAdsIndex = adsIndex % adsCubit.ads.length;
                      final repeatedAdsItem = adsCubit.ads[repeatedAdsIndex];
                      bool hasImage = repeatedAdsItem.image != null && repeatedAdsItem.image!.isNotEmpty;
                      return hasImage
                          ? AdsItemWithImage(adsItemModel: repeatedAdsItem)
                          : AdsItem(adsItemModel: repeatedAdsItem);
                    }
                  }
                  // Return an empty SizedBox if ads data is not yet available or adsIndex is out of range
                  return const SizedBox();
                },
              );
            } else {
              return const SizedBox(); // Otherwise, return an empty SizedBox
            }
          },
          /*separatorBuilder: (context, index) {
            if ((index + 1) % 2 == 0 && index != newsCubit.news.length - 1) {
              return BlocBuilder<AdsCubit, AdsState>(
                builder: (context, adsState) {
                  final adsItem = adsCubit.ads[index +1];
                  bool hasImage = adsItem.image != null && adsItem.image!.isNotEmpty;
                  return hasImage
                      ? AdsItemWithImage(adsItemModel: adsItem)
                      : AdsItem(adsItemModel: adsItem);
                },
              );
            } else {
              return const SizedBox(); // Otherwise, return an empty SizedBox
            }
          }*/
          itemCount: newsCubit.news.length,
        );
      },
    );
  }
}
