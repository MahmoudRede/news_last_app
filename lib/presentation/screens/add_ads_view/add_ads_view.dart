import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/ads_cubit/ads_cubit.dart';
import 'package:news_last_app/presentation/screens/add_ads_view/widgets/add_ads_view_body.dart';

class AddAdsView extends StatelessWidget {
  const AddAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdsCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: const AddAdsViewBody(),
      ),
    );
  }
}
