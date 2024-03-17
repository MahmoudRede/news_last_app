import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/image_cubit/image_cubit.dart';
import '../image_item.dart';

class PicturesBody extends StatelessWidget {
  const PicturesBody({super.key});

  @override
  Widget build(BuildContext context) {
    ImageCubit cubit = ImageCubit.get(context);
    return  BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ImageItem(imageModel: cubit.images[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: cubit.images.length);
      },
    );
  }
}
