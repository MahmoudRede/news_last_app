import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_cubit.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_states.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/tabs_body/death_details.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class DeadBody extends StatelessWidget {
  const DeadBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        EventsCubit.get(context).getDeaths();
        return BlocConsumer<EventsCubit, EventsState>(
          listener: (context, state) {},
          builder: (context, state) {

            return Scaffold(
              backgroundColor: ColorManager.white,
              body: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(SizeConfig.height * 0.01),
                        child: InkWell(
                          onTap: (){
                            customPushNavigator(context, DeathDetailsScreen(deathModel: EventsCubit.get(context).deaths[index],));
                          },
                          child: Container(
                            width: SizeConfig.width,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(SizeConfig.height * 0.015),
                              color: ColorManager.white,
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: ColorManager.darkWhite,
                                  child: Padding(
                                    padding: EdgeInsets.all(SizeConfig.height * 0.01,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// death date
                                        Text(
                                          EventsCubit.get(context).deaths[index].date,
                                          style: TextStyle(
                                            fontSize: SizeConfig.headline3Size,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.gold,
                                          ),
                                        ),

                                        /// number of deaths
                                        Row(
                                          children: [
                                            Text(
                                              "عدد الوفيات",
                                              style: TextStyle(
                                                fontSize: SizeConfig.headline5Size,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.grey,
                                              ),
                                            ),
                                            SizedBox(width: SizeConfig.height*0.01,),
                                            Text(
                                              "1",
                                              style: TextStyle(
                                                fontSize: SizeConfig.headline5Size,
                                                fontWeight: FontWeight.w500,
                                                color: ColorManager.gold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: SizeConfig.height * 0.01,),

                                /// person name
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.01),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          EventsCubit.get(context).deaths[index].personName,
                                          style: TextStyle(
                                            fontSize: SizeConfig.headline2Size,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          EventsCubit.get(context).deaths[index].location,
                                          style: TextStyle(
                                              fontSize: SizeConfig.headline6Size,
                                              fontWeight: FontWeight.w600,
                                              color: ColorManager.grey,
                                              height: 1
                                          ),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.01),
                                  child: Row(
                                    children: [
                                      Text(
                                        EventsCubit.get(context).deaths[index].personAge,
                                        style: TextStyle(
                                          fontSize: SizeConfig.headline4Size,
                                          fontWeight: FontWeight.w400,
                                          color: ColorManager.grey,
                                        ),
                                      ),
                                      SizedBox(width: SizeConfig.height*0.005,),
                                      Text(
                                        "سنة",
                                        style: TextStyle(
                                          fontSize: SizeConfig.headline4Size,
                                          fontWeight: FontWeight.w400,
                                          color: ColorManager.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: SizeConfig.height*0.006,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      itemCount: EventsCubit.get(context).deaths.length,
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
