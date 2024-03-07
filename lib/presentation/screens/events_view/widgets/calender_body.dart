import 'package:flutter/material.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderBody extends StatelessWidget {
  const CalenderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TableCalendar(
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: ColorManager.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  canMarkersOverflow: true,
                ),
                calendarFormat: CalendarFormat.month,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: SizeConfig.headline2Size,
                    color: ColorManager.primaryColor,
                  ),
                ),
                firstDay: DateTime.now(),
                lastDay: DateTime.now().add(const Duration(days: 5 * 365)),
                focusedDay: DateTime.now(),
                onDaySelected: (selectedDay, focusedDay) {},
              ),
              SizedBox(
                height: SizeConfig.height * 0.02,
              ),
              const Divider(),
                SizedBox(
                  height:  SizeConfig.height * 0.04,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Container(
                        width: SizeConfig.height * 0.015,
                        height: SizeConfig.height * 0.015,
                        decoration: const BoxDecoration(
                          color: ColorManager.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.width * 0.01,
                      ),
                      Text(
                        "مناسبة واحدة",
                        style: TextStyle(
                          fontSize: SizeConfig.headline4Size,
                        ),
                      ),
                    ]),
                    Row(children: [
                      Container(
                        width: SizeConfig.height * 0.015,
                        height: SizeConfig.height * 0.015,
                        decoration: const BoxDecoration(
                          color: ColorManager.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.width * 0.01,
                      ),
                      Text(
                        "مناسبتان",
                        style: TextStyle(
                          fontSize: SizeConfig.headline4Size,
                        ),
                      ),
                    ]),
                    Row(children: [
                      Container(
                        width: SizeConfig.height * 0.015,
                        height: SizeConfig.height * 0.015,
                        decoration: const BoxDecoration(
                          color: ColorManager.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.width * 0.01,
                      ),
                      Text(
                        "أكثر من مناسبة",
                        style: TextStyle(
                          fontSize: SizeConfig.headline4Size,
                        ),
                      ),
                    ]),
                  ],
                                ),
                ),
              const Divider(),

            ],
          ),
        ),
      ),
    );
  }
}
