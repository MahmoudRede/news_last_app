import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/presentation/screens/home_screen/widgets/donation_item.dart';

class DonationBody extends StatelessWidget {
  const DonationBody({super.key});

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
              return DonationItem(messageContent: cubit.donationList[index].content??"");
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: cubit.donationList.length);
      },
    );

  }
}
