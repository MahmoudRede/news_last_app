import 'package:flutter/material.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/presentation/screens/home_screen/models/image_model.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.imageModel});

  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 18),
        child: Column(
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

            const SizedBox(height: 10,),

            Image.network(
              '${imageModel.image}',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
