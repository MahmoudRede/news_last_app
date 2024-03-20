import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';



customToast({
      required String title,
      required Color color
    })
{
  Fluttertoast.showToast(
      msg: title,
      textColor: ColorManager.white,
      backgroundColor: color,
      gravity: ToastGravity.CENTER
  );

}
