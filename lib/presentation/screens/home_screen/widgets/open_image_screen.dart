import 'package:flutter/material.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';

class OpenImageScreen extends StatelessWidget {
  final String image;
  const OpenImageScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image(
            height: SizeConfig.height*0.9,
            width: SizeConfig.width,
            image: NetworkImage(image),
          ),
        ],
      ),
    );
  }
}
