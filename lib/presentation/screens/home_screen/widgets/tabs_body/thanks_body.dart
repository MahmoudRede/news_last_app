import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/thanks_item.dart';

class ThanksBody extends StatelessWidget {
  const ThanksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ThanksItem(
                  messageUid: cubit.thanksList[index].uId??"",
                  imageUrl: cubit.thanksList[index].imagePath??"",
                  messageTitle: cubit.thanksList[index].title??"",
                  messageBody: cubit.thanksList[index].message??"",
                  personName: cubit.thanksList[index].personName??"");
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: cubit.thanksList.length);
      },
    );
  }
}
