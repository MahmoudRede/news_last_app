import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_cubit.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_states.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/event_item.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';


class AllEventsBody extends StatelessWidget {
  const AllEventsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          return BlocConsumer<EventsCubit, EventsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: SizeConfig.height * 0.01,),
                      itemBuilder: (context, index) => EventItem(eventItemModel: EventsCubit.get(context).eventsWithDateList[index],),
                      itemCount: EventsCubit.get(context).eventsWithDateList.length,
                    ),
                  ),

                ],
              );
            },
          );
        }
    );
  }
}
