import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import '../models/add_grid_view_model.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.addPostModel, });
  final AddGridViewModel addPostModel;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(color: Colors.black54, shadows: const [
      Shadow(
        color: Colors.white,
        blurRadius: 3,
        offset: Offset(0, 1),
      )
    ]);
    return InkWell(
      onTap: addPostModel.function,
      borderRadius: BorderRadius.circular(20.0),
      child: SizedBox(
          height: 160.0,
          width: 160.0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        height: MediaQuery.sizeOf(context).height * 0.15,
                        width: MediaQuery.sizeOf(context).width * 0.15,
                        addPostModel.image,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      addPostModel.title,
                      style:  TextStyle(
                        color: ColorManager.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.sizeOf(context).height * 0.022,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
          )),
    );
  }
}
