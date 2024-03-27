import 'package:flutter/material.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/addDeathScreen/screen/add_death_screen.dart';
import 'package:news_last_app/presentation/screens/addEventScreen/Screen/add_event_screen.dart';
import 'package:news_last_app/presentation/screens/add_ads_view/add_ads_view.dart';
import 'package:news_last_app/presentation/screens/add_donation_screen/add_donation_screen.dart';
import 'package:news_last_app/presentation/screens/add_image_view/add_image_view.dart';
import 'package:news_last_app/presentation/screens/add_news_view/add_news_view.dart';
import 'package:news_last_app/presentation/screens/add_thanks_screen/add_thanks_screen.dart';
import 'package:news_last_app/presentation/screens/add_video/video_screen.dart';
import 'package:news_last_app/presentation/screens/add_view/widgets/grid_view_item.dart';
import 'package:news_last_app/presentation/screens/dawina_screen/add_dawina.dart';

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
          title: 'اضافة خبر',
          () => customPushNavigator(context, const AddNewsView())),
      AddGridViewModel(
          image: Assets.imagesEvents, title: 'اضافة مناسبة', () => customPushNavigator(context, const AddEventScreen())),
      AddGridViewModel(
          image: Assets.imagesPicture,
          title: 'اضافة صورة',
          () => customPushNavigator(context, const AddImageView())),
      AddGridViewModel(
          image: Assets.imagesVideo, title: 'اضافة فيديو', () => customPushNavigator(context, const AddVideoView())),
      AddGridViewModel(
          image: Assets.imagesDead, title: 'اضافة حالة وفاة', () => customPushNavigator(context, const AddDeathScreen())),
      AddGridViewModel(
          image: Assets.donating, title: 'اضافة تهنئة', () => customPushNavigator(context, const AddDonationScreen())),
      AddGridViewModel(
          image: Assets.thanks,
          title: 'اضافة شكر',
          () => customPushNavigator(context, const AddThanksScreen())),
      AddGridViewModel(
          image: Assets.dawina,
          title: 'اضافة دواينه',
              () => customPushNavigator(context,  AddDawina())),
      AddGridViewModel(
          image: Assets.imagesAdvertisement,
          title: 'اضافة إعلان',
              () => customPushNavigator(context,  const AddAdsView())),

    ];
    return GridView.count(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      children: List.generate(items.length, (index) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          child: GridViewItem(addPostModel: items[index]),
        );
      }),
    );
  }
}
