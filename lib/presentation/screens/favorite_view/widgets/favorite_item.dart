import 'package:flutter/material.dart';
import 'package:news_last_app/generated/assets.dart';

import '../../../../styles/app_size/app_size_config.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(Assets.imagesProfilePic),
                ),
                SizedBox(
                  height: SizeConfig.height*0.015,
                ),
                Text(
                  'Test',
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
                  'Teeeeest',
                  textAlign: TextAlign.start,
                  style:   TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.headline5Size,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height*0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
