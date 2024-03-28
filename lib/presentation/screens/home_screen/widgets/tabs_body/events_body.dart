import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_cubit.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_states.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/event_item.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class EventsBody extends StatelessWidget {
  const EventsBody({super.key});

  @override
  Widget build(BuildContext context) {


    return Builder(
      builder: (context) {
        EventsCubit.get(context).getEvents();
        return BlocConsumer<EventsCubit, EventsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: ColorManager.white,
              body: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: SizeConfig.height * 0.01,),
                      itemBuilder: (context, index) => EventItem(eventItemModel: EventsCubit.get(context).events[index],),
                      itemCount: EventsCubit.get(context).events.length,
                    ),
                  ),

                ],
              ),
            );
          },
        );
      }
    );
  }
}
