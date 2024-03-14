import 'package:flutter/material.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/add_post_view/widgets/grid_view_item.dart';

import 'models/add_post_model.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final List<AddPostModel> items =  [
    AddPostModel(image: Assets.assetsImagesNews, title: 'اضافة\nخبر',() => null),
    AddPostModel(image: Assets.imagesEvents, title: 'اضافة\nمناسبة',() => null),
    AddPostModel(image: Assets.imagesPicture, title: 'اضافة\nصورة',() => null),
    AddPostModel(image: Assets.imagesVideo, title: 'اضافة\nفيديو',() => null),
    AddPostModel(image: Assets.imagesDead, title: 'اضافة\nحالة وفاة',() => null),
  ];

  @override
  Widget build(BuildContext context) {
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
