import 'package:flutter/material.dart';

import '../../../../core/local/cash_helper.dart';
import '../../../../data/models/ads_item_model.dart';
import '../../../../styles/app_size/app_size_config.dart';
import '../../../../styles/color_manager/color_manager.dart';

class AdsItemWithImage extends StatelessWidget {
  const AdsItemWithImage({super.key, required this.adsItemModel});

  final AdsItemModel adsItemModel;
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

                /// Admin check
                CashHelper.getData(key: 'isAdmin') == true ?
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: Icon(
                      Icons.delete_forever,
                      color: ColorManager.red,
                      size: SizeConfig.width * 0.09,
                    ),
                  ),
                ):Container(),

                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network('${adsItemModel.image}'),
                ),
                SizedBox(
                  height: SizeConfig.height*0.015,
                ),
                Text(
                  '${adsItemModel.headline}',
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
                  '${adsItemModel.details}',
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


class AdsItem extends StatelessWidget {
  const AdsItem({super.key, required this.adsItemModel});

  final AdsItemModel adsItemModel;

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

                /// Admin check
                CashHelper.getData(key: 'isAdmin') == true ?
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: Icon(
                      Icons.delete_forever,
                      color: ColorManager.red,
                      size: SizeConfig.width * 0.09,
                    ),
                  ),
                ):Container(),

                SizedBox(
                  height: SizeConfig.height*0.015,
                ),
                Text(
                  '${adsItemModel.headline}',
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
                  '${adsItemModel.details}',
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