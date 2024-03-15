import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/add_thanks_screen/add_thanks_screen.dart';
import 'models/add_post_model.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final List<AddPostModel> items =  [
    AddPostModel(image: Assets.assetsImagesNews, title: 'اضافة\nخبر',() {}),
    AddPostModel(image: Assets.imagesEvents, title: 'اضافة\nمناسبة',() {}),
    AddPostModel(image: Assets.imagesPicture, title: 'اضافة\nصورة',() {}),
    AddPostModel(image: Assets.imagesVideo, title: 'اضافة\nفيديو',() {}),
    AddPostModel(image: Assets.imagesDead, title: 'اضافة\nحالة وفاة',() {}),
    AddPostModel(image: Assets.donating, title: 'إضافة\nإهداء',() {}),
    AddPostModel(image: Assets.thanks, title: 'إضافة\nشُكر',() {
      Get.to( const AddThanksScreen());
    }),
  ];

  @override
  Widget build(BuildContext context) {
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
