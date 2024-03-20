import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
            child: Container(
                height: MediaQuery.of(context).size.height * .4,
                width: double.infinity,
                child: Lottie.asset('assets/images/social.json')
            ),
          );
        }
    );
  }
}