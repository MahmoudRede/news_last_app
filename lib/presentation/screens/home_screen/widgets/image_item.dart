import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/home_screen/models/image_model.dart';

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
