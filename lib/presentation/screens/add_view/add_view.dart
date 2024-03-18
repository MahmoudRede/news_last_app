import 'package:flutter/material.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/add_image_view/add_image_view.dart';
import 'package:news_last_app/presentation/screens/add_news_view/add_news_view.dart';
import 'package:news_last_app/presentation/screens/add_thanks_screen/add_thanks_screen.dart';
import 'package:news_last_app/presentation/screens/add_view/widgets/grid_view_item.dart';

import 'models/add_grid_view_model.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
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
          image: Assets.imagesPicture,
          title: 'اضافة\nصورة',
          () => customPushNavigator(context, const AddImageView())),
      AddGridViewModel(
          image: Assets.imagesVideo, title: 'اضافة\nفيديو', () => null),
      AddGridViewModel(
          image: Assets.imagesDead, title: 'اضافة\nحالة وفاة', () => null),
      AddGridViewModel(
          image: Assets.donating, title: 'اضافة\nتهنئة', () => null),
      AddGridViewModel(
          image: Assets.thanks,
          title: 'اضافة\nشكر',
          () => customPushNavigator(context, const AddThanksScreen())),
    ];
    return GridView.count(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
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
