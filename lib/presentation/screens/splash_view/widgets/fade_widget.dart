import 'package:flutter/material.dart';
import 'package:news_last_app/generated/assets.dart';

class FadeWidget extends StatelessWidget {
  const FadeWidget({
    super.key,
    required this.fadeAnimation,
  });

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: fadeAnimation,
        builder: (context,_) {
          return FadeTransition(
            opacity: fadeAnimation,
            child: Image.asset(Assets.imagesFacebook),
          );
        }
    );
  }
}