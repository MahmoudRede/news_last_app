import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/presentation/screens/events_view/widgets/all_events_body.dart';
import 'package:news_last_app/presentation/screens/events_view/widgets/calender_body.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return SizedBox(
          height: SizeConfig.height,
          width: SizeConfig.width,
          child: Column(
            children: [
              SizedBox(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: cubit.eventsIndex,
                  child: TabBar(
                    physics: const NeverScrollableScrollPhysics(),
                    isScrollable: true,
                    indicatorColor: ColorManager.primaryColor,
                    labelColor: ColorManager.primaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.height * .035),
                    onTap: (int index) {
                      cubit.changeEventsTabs(index);
                    },
                    tabs: [
                      Tab(
                        child: Text(
                          "التقويم",
                          style: TextStyle(
                            fontSize: SizeConfig.headline3Size,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "جميع المناسبات",
                          style: TextStyle(
                            fontSize: SizeConfig.headline3Size,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              cubit.eventsIndex == 0
                  ? const Expanded(child: CalenderBody())
                  : const Expanded(child: AllEventsBody()),
            ],
          ),
        );
      },
    );
  }
}
