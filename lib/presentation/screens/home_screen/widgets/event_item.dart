import 'package:flutter/material.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/presentation/screens/addEventScreen/models/Event_item_model.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/open_image_screen.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class EventItem extends StatelessWidget {
  final EventItemModel eventItemModel;
  const EventItem({super.key, required this.eventItemModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      eventItemModel.userName!,
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
                  eventItemModel.title!,
                  style: TextStyle(
                    fontSize: SizeConfig.headline4Size,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.black,
                  ),
                ),
              ),

              SizedBox(height: SizeConfig.height * 0.01),

              /// event image
              InkWell(
                onTap: ()=>customPushNavigator(context, OpenImageScreen(image: eventItemModel.image!.toString())),
                child: Image(
                  height: SizeConfig.height * 0.45,
                  width: SizeConfig.width,
                  image: NetworkImage(eventItemModel.image!.toString()),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
