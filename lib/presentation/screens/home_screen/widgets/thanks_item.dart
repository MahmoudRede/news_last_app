import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class ThanksItem extends StatelessWidget {
  final String imageUrl;
  final String messageTitle;
  final String messageBody;
  final String personName;
  const ThanksItem({ required this.imageUrl, required this.messageTitle, required this.messageBody, required this.personName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin:  EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.01
        ),
        child: Material(
          elevation: SizeConfig.height * 0.015,
          borderRadius:  BorderRadius.circular(20),
          shadowColor: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 imageUrl == "" ? Container() : ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(imageUrl: imageUrl,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height*0.015,
                ),
                Text(
                  messageTitle,
                  textAlign: TextAlign.start,
                  style:   TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.headline4Size,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height*0.01,
                ),
                Text(
                  messageBody,
                  textAlign: TextAlign.start,
                  style:   TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.headline5Size,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height*0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "رسالة الشكر إلي: "+personName ,
                    textAlign: TextAlign.start,
                    style:   TextStyle(
                      color: ColorManager.black.withOpacity(.7),
                      fontSize: SizeConfig.headline5Size,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
