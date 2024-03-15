import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/presentation/screens/add_news_view/widgets/add_news_body.dart';

import '../../../business_logic/news_cubit/news_cubit.dart';

class AddNewsView extends StatelessWidget {
  const AddNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: const AddNewsBody(),
      ),
    );
  }
}
