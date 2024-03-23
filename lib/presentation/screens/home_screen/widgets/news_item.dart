import 'package:flutter/material.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/presentation/screens/home_screen/models/news_item_model.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class NewsItemWithImage extends StatelessWidget {
  const NewsItemWithImage({super.key, required this.newsItemModel});

  final NewsItemModel newsItemModel;
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
                  child: Image.network('${newsItemModel.image}'),
                ),
                SizedBox(
                  height: SizeConfig.height*0.015,
                ),
                Text(
                    '${newsItemModel.headline}',
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
                  '${newsItemModel.details}',
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


class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.newsItemModel});

  final NewsItemModel newsItemModel;

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
                  '${newsItemModel.headline}',
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
                  '${newsItemModel.details}',
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
