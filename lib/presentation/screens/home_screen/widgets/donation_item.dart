import 'package:flutter/material.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class DonationItem extends StatelessWidget {
  final String messageContent;

  const DonationItem({required this.messageContent, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        // height: SizeConfig.height * 0.25,
        width: SizeConfig.width,
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.01),
        decoration:   BoxDecoration(
          borderRadius:const BorderRadius.all(
            Radius.circular(20.0),
          ),
          image:const DecorationImage(
              image: AssetImage(Assets.celebrate),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover),
          boxShadow:  [
            BoxShadow(
              color: ColorManager.black.withOpacity(.5),
              blurRadius: 2,
              blurStyle:  BlurStyle.outer,
              spreadRadius: 1.0,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Text(
              messageContent,
              style:   TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.headline2Size,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
      ),
    );
  }
}
