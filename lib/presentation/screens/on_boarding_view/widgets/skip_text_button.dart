import 'package:flutter/material.dart';

import 'onboarding_constants.dart';

class SkipTextButton extends StatelessWidget {
  const SkipTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          submit(context);
        },
        child: const Text(
          'SKIP',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ));
  }
}