import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/image_cubit/image_cubit.dart';

class AddImageViewBody extends StatelessWidget {
  const AddImageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ImageCubit.get(context);
        return SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (cubit.image != null)
                    Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Image(image: FileImage(cubit.image!)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.3),
                              radius: 18,
                              child: IconButton(
                                  splashRadius: 30.0,
                                  onPressed: () {
                                    cubit.removeImage();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 18.0,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ElevatedButton(
                      onPressed: () {
                        cubit.pickImage();
                      },
                      child: const Text('add')),
                  ElevatedButton(
                      onPressed: () {
                        cubit.uploadImage();
                      },
                      child: const Text('upload')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
