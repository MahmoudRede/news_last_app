import 'package:flutter/material.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/add_news_view/add_news_view.dart';
import 'package:news_last_app/presentation/screens/add_view/widgets/grid_view_item.dart';

import 'models/add_grid_view_model.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  @override
  Widget build(BuildContext context) {
    final List<AddGridViewModel> items = [
      AddGridViewModel(
          image: Assets.assetsImagesNews,
          title: 'اضافة\nخبر',
          () => customPushNavigator(context, const AddNewsView())),
      AddGridViewModel(
          image: Assets.imagesEvents, title: 'اضافة\nمناسبة', () => null),
      AddGridViewModel(
          image: Assets.imagesPicture, title: 'اضافة\nصورة', () => null),
      AddGridViewModel(
          image: Assets.imagesVideo, title: 'اضافة\nفيديو', () => null),
      AddGridViewModel(
          image: Assets.imagesDead, title: 'اضافة\nحالة وفاة', () => null),
    ];
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 2.0,
      children: List.generate(items.length, (index) {
        return Center(
          child: GridViewItem(addPostModel: items[index]),
        );
      }),
    );
  }
}
