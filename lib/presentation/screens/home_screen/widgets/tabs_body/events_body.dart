import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class EventsBody extends StatelessWidget {
  const EventsBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                  elevation: 5.0,
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
                                'محمد ممدوح',
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
                            'عنوان المناسبة',
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
                          height: SizeConfig.height * 0.3,
                          width: SizeConfig.width,
                          image: const AssetImage('assets/images/profile.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              itemCount: 5,
            ),
          ),

        ],
      ),
    );
  }
}
