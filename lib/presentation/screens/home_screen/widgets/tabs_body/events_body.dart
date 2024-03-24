import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_cubit.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_states.dart';
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
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(SizeConfig.height * 0.01),
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(SizeConfig.height * 0.015),
                          child: Container(
                            width: SizeConfig.width,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(SizeConfig.height * 0.015),
                              color: ColorManager.darkWhite2,
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(SizeConfig.height * 0.01,),
                                  child: Row(
                                    children: [
                                      /// user image
                                      CircleAvatar(
                                        radius: SizeConfig.height * 0.03,
                                        backgroundImage: const AssetImage('assets/images/events.png'),
                                      ),
                                      SizedBox(width: SizeConfig.width * 0.01,),

                                      /// user name
                                      Text(
                                        EventsCubit.get(context).events[index].userName!,
                                        style: TextStyle(
                                          fontSize: SizeConfig.headline3Size,
                                          fontWeight: FontWeight.w600,
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                /// event title
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.01),
                                  child: Text(
                                    EventsCubit.get(context).events[index].title!,
                                    style: TextStyle(
                                      fontSize: SizeConfig.headline4Size,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.black,
                                    ),
                                  ),
                                ),

                                SizedBox(height: SizeConfig.height * 0.01),

                                /// event image
                                Image(
                                  height: SizeConfig.height * 0.45,
                                  width: SizeConfig.width,
                                  image: NetworkImage(EventsCubit.get(context).events[index].image!.toString()),
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
