import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/business_logic/image_cubit/image_cubit.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/tabs_body/dead_body.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/tabs_body/donation_body.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/tabs_body/events_body.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/tabs_body/pictures_body.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/tabs_body/thanks_body.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import '../../../../business_logic/news_cubit/news_cubit.dart';
import '../../../../styles/color_manager/color_manager.dart';
import '../widgets/tabs_body/news_body.dart';
import '../widgets/tabs_body/videos_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getNews()),
        BlocProvider(create: (context) => ImageCubit()..getImages())],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AppCubit.get(context);
          return SizedBox(
            height: SizeConfig.height,
            width: SizeConfig.width,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.height * 0.12,
                  child: DefaultTabController(
                    length: 7,
                    initialIndex: cubit.selectedIndex,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: TabBar(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: ColorManager.primaryColor,
                        labelColor: ColorManager.primaryColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        onTap: (int index) {
                          cubit.changeHomeTabs(index);
                        },
                        tabs: [
                          Tab(
                            height: SizeConfig.height * 0.12,
                            child: Column(
                              children: [
                                Image(
                                  image: const AssetImage(
                                      "assets/images/news.png"),
                                  width: SizeConfig.height * 0.04,
                                  height: SizeConfig.height * 0.04,
                                ),
                                SizedBox(
                                  height: SizeConfig.height * 0.01,
                                ),
                                Text(
                                  "الاخبار",
                                  style: TextStyle(
                                    fontSize: SizeConfig.headline6Size,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            height: SizeConfig.height * 0.12,
                            child: Column(
                              children: [
                                Image(
                                  image: const AssetImage(
                                      "assets/images/events.png"),
                                  width: SizeConfig.height * 0.04,
                                  height: SizeConfig.height * 0.04,
                                ),
                                SizedBox(
                                  height: SizeConfig.height * 0.01,
                                ),
                                Text(
                                  "المناسبات",
                                  style: TextStyle(
                                    fontSize: SizeConfig.headline6Size,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            height: SizeConfig.height * 0.12,
                            child: Column(
                              children: [
                                Image(
                                  image: const AssetImage(
                                      "assets/images/picture.png"),
                                  width: SizeConfig.height * 0.04,
                                  height: SizeConfig.height * 0.04,
                                ),
                                SizedBox(
                                  height: SizeConfig.height * 0.01,
                                ),
                                Text(
                                  "الصور",
                                  style: TextStyle(
                                    fontSize: SizeConfig.headline6Size,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            height: SizeConfig.height * 0.12,
                            child: Column(
                              children: [
                                Image(
                                  image: const AssetImage(
                                      "assets/images/video.png"),
                                  width: SizeConfig.height * 0.04,
                                  height: SizeConfig.height * 0.04,
                                ),
                                SizedBox(
                                  height: SizeConfig.height * 0.01,
                                ),
                                Text(
                                  "الفيديوهات",
                                  style: TextStyle(
                                    fontSize: SizeConfig.headline6Size,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            height: SizeConfig.height * 0.12,
                            child: Column(
                              children: [
                                Image(
                                  image: const AssetImage(
                                      "assets/images/dead.png"),
                                  width: SizeConfig.height * 0.04,
                                  height: SizeConfig.height * 0.04,
                                ),
                                SizedBox(
                                  height: SizeConfig.height * 0.01,
                                ),
                                Text(
                                  "الوفيات",
                                  style: TextStyle(
                                    fontSize: SizeConfig.headline6Size,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            height: SizeConfig.height * 0.12,
                            child: Column(
                              children: [
                                Image(
                                  image: const AssetImage(
                                      Assets.thanks),
                                  width: SizeConfig.height * 0.04,
                                  height: SizeConfig.height * 0.04,
                                ),
                                SizedBox(
                                  height: SizeConfig.height * 0.01,
                                ),
                                Text(
                                  "شكر",
                                  style: TextStyle(
                                    fontSize: SizeConfig.headline6Size,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            height: SizeConfig.height * 0.12,
                            child: Column(
                              children: [
                                Image(
                                  image: const AssetImage(
                                      Assets.donating),
                                  width: SizeConfig.height * 0.04,
                                  height: SizeConfig.height * 0.04,
                                ),
                                SizedBox(
                                  height: SizeConfig.height * 0.01,
                                ),
                                Text(
                                  "تهنئة",
                                  style: TextStyle(
                                    fontSize: SizeConfig.headline6Size,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                cubit.selectedIndex == 0
                    ? const Expanded(child: NewsBody())
                    : cubit.selectedIndex == 1
                    ? const Expanded(child: EventsBody())
                    : cubit.selectedIndex == 2
                    ? const Expanded(child: PicturesBody())
                    : cubit.selectedIndex == 3
                    ? const Expanded(child: VideosBody())
                    : cubit.selectedIndex == 4
                    ?const Expanded(child: DeadBody())
                    :cubit.selectedIndex == 5
                ? const Expanded(child: ThanksBody())
                    : const Expanded(child: DonationBody()),
              ],
            ),
          );
        },
      ),
    );
  }
}