import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/news_cubit/news_cubit.dart';

class AddNewsBody extends StatelessWidget {
  const AddNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var detailsController = TextEditingController();
    var headlineController = TextEditingController();
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: headlineController,
                  decoration: const InputDecoration(hintText: 'عنوان الخبر'),
                ),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: detailsController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'تفاصيل الخبر...'),
                ),
                if (cubit.newsImage != null)
                  Card(
                    elevation: 10,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Image(
                          image: FileImage(cubit.newsImage!),
                          fit: BoxFit.cover,
                          height: 200.0,
                          width: double.infinity,
                        ),
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
                      cubit.getImage();
                    },
                    child: const Text('add')),
                ElevatedButton(
                    onPressed: () {
                      cubit.uploadPostImage(
                          headline: headlineController.text,
                          details: detailsController.text);
                    },
                    child: const Text('create')),
              ],
            ),
          ),
        );
      },
    );
  }
}
