import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/widgets/default_text_field.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class AddDawinaItem extends StatelessWidget {
  const AddDawinaItem({super.key,
    required this.itemName,
    required this.validator,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.onTap,
    required this.controller,
    this.maxLines = 1
  });

  final String itemName;
  final String validator;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final VoidCallback onTap;
  final TextEditingController controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Text(itemName,style: TextStyle(
          fontSize: SizeConfig.height * 0.022,
          fontWeight: FontWeight.bold,
          color: ColorManager.primaryColor,
        ),),

        SizedBox(height: SizeConfig.height*0.02,),

        DefaultTextField(
          maxLines: maxLines,
          controller: controller,
          hintText: hintText,
          validator: (value) {
            if (value!.isEmpty) {
              return validator;
            }
          },
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onTap: () {onTap();},
        ),
      ],
    );
  }
}
