import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/image_cubit/image_cubit.dart';
import 'package:news_last_app/presentation/screens/add_image_view/widgets/add_image_view_body.dart';
import 'package:news_last_app/presentation/screens/add_video/widgets/add_video_view_body.dart';

class AddVideoView extends StatelessWidget {
  const AddVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: const AddVideoViewBody(),
      ),
    );
  }
}
