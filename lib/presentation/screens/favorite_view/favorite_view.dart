import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/favorite_view/widgets/favorite_item.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index){
          return const FavoriteItem();
        },
        separatorBuilder: (context,index){
         return const SizedBox(
            height: 8,
          );
        },
        itemCount: 5);
  }
}
