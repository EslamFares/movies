import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/core/utils/app/app_assets.dart';
import 'package:movies/core/utils/app/app_text_styles.dart';
import 'package:movies/core/utils/extensions/spacing_extensions.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spaceExpanded(),
          Image.asset(AppAssets.splashAndroid12),
          spaceExpanded(),
          DefaultTextStyle(
            style: AppTextStyles.font22BlueDarkW900,
            child: AnimatedTextKit(
              animatedTexts: [WavyAnimatedText('Movies')],
              isRepeatingAnimation: true,
            ),
          ),
        ],
      ),
    );
  }
}
