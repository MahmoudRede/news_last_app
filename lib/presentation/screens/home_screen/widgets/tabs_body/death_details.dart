import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class DeathDetailsScreen extends StatelessWidget {
  const DeathDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 5,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [



          // person name
          Container(
            width: SizeConfig.width,
            height: SizeConfig.height * 0.08,
            color: ColorManager.lightGrey2,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.height * 0.01),
              child: Text(
                'على مرزوق محمد مرزوق',
                style: TextStyle(
                  fontSize: SizeConfig.headline1Size,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          SizedBox(height: SizeConfig.height*0.015,),

          /// age
          Padding(
            padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.06),
            child: Row(
              children: [
                Text(
                  "العمر",
                  style: TextStyle(
                    fontSize: SizeConfig.headline4Size,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.grey,
                  ),
                ),
                SizedBox(width: SizeConfig.height*0.02,),


                Text(
                  "68",
                  style: TextStyle(
                    fontSize: SizeConfig.headline5Size,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.black,
                  ),
                ),
                SizedBox(width: SizeConfig.height*0.005,),
                Text(
                  "سنة",
                  style: TextStyle(
                    fontSize: SizeConfig.headline5Size,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.black,
                  ),
                ),
              ],
            ),
          ),


          const Divider(color: ColorManager.lightGrey2, thickness: 1),


          Padding(
            padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.06),
            child: Row(
              children: [
                Text(
                  "الدفن",
                  style: TextStyle(
                    fontSize: SizeConfig.headline4Size,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.grey,
                  ),
                ),
                SizedBox(width: SizeConfig.height*0.02,),


                Text(
                  DateFormat('EEEE  dd - MM - yyyy', 'ar').format(DateTime.now()),
                  style: TextStyle(
                    fontSize: SizeConfig.headline4Size,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.black,
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: ColorManager.lightGrey2, thickness: 1),

          Padding(
            padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.06),
            child: Text(
              "بعد صلاة العصر من مقبرة الصليبيخات",
              style: TextStyle(
                fontSize: SizeConfig.headline4Size,
                fontWeight: FontWeight.w400,
                color: ColorManager.black,
              ),
            ),
          ),


          SizedBox(height: SizeConfig.height*0.02,),

          // عزاء الرجال
          Container(
            width: SizeConfig.width,
            height: SizeConfig.height * 0.06,
            color: ColorManager.lightGrey2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.025 , vertical: SizeConfig.height * 0.015),
              child: Text(
                'عزاء الرجال',
                style: TextStyle(
                  fontSize: SizeConfig.headline3Size,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.025, vertical: SizeConfig.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "فى المقبرة",
                  style: TextStyle(
                    fontSize: SizeConfig.headline4Size,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.black,
                  ),
                ),

                Container(
                  height: SizeConfig.height * 0.05,
                  width: SizeConfig.height * 0.05,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: ColorManager.gold,
                  ),

                  child: Icon(
                    Icons.location_on_rounded,
                    color: ColorManager.white,
                    size: SizeConfig.height * 0.025,
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: ColorManager.lightGrey2, thickness: 1),

          Padding(
            padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.025, vertical: SizeConfig.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "99006263",
                  style: TextStyle(
                    fontSize: SizeConfig.headline2Size,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.black,
                  ),
                ),

                Row(
                  children: [

                    SizedBox(width: SizeConfig.height*0.01,),
                    Icon(
                      Icons.chat,
                      color: ColorManager.grey,
                      size: SizeConfig.height * 0.03,
                    ),
                    SizedBox(width: SizeConfig.height*0.01,),
                    Icon(
                      Icons.call,
                      color: ColorManager.grey,
                      size: SizeConfig.height * 0.03,
                    ),
                  ],
                ),
              ],
            ),
          ),


          // عزاء النساء
          Container(
            width: SizeConfig.width,
            height: SizeConfig.height * 0.06,
            color: ColorManager.lightGrey2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.025 , vertical: SizeConfig.height * 0.015),
              child: Text(
                'عزاء النساء',
                style: TextStyle(
                  fontSize: SizeConfig.headline3Size,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.025, vertical: SizeConfig.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "صباح السالم ق4",
                  style: TextStyle(
                    fontSize: SizeConfig.headline4Size,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.black,
                  ),
                ),

                Container(
                  height: SizeConfig.height * 0.05,
                  width: SizeConfig.height * 0.05,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: ColorManager.gold,
                  ),

                  child: Icon(
                    Icons.location_on_rounded,
                    color: ColorManager.white,
                    size: SizeConfig.height * 0.025,
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: ColorManager.lightGrey2, thickness: 1),

          Padding(
            padding: EdgeInsets.symmetric(horizontal:SizeConfig.height * 0.025, vertical: SizeConfig.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "99006263",
                  style: TextStyle(
                    fontSize: SizeConfig.headline2Size,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.black,
                  ),
                ),

                Row(
                  children: [

                    SizedBox(width: SizeConfig.height*0.01,),
                    Icon(
                      Icons.chat,
                      color: ColorManager.grey,
                      size: SizeConfig.height * 0.03,
                    ),
                    SizedBox(width: SizeConfig.height*0.01,),
                    Icon(
                      Icons.call,
                      color: ColorManager.grey,
                      size: SizeConfig.height * 0.03,
                    ),
                  ],
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
