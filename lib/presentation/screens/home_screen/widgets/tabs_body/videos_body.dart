import 'package:flutter/material.dart';
import 'package:news_last_app/constants/shimmer.dart';
import 'package:shimmer/shimmer.dart';

class VideosBody extends StatelessWidget {
  const VideosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const NewsItemShimmer();
  }
}
