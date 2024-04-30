import 'package:flutter/material.dart';

import '../utils/app/app_text_styles.dart';

class TilteText extends StatelessWidget {
  const TilteText(this.txt, {super.key, this.padding, this.alignment});
  final String txt;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 16, bottom: 16, left: 0),
      child: Align(
          alignment: alignment ?? Alignment.centerLeft,
          child: Text(txt,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.font22BlueDarkW900)),
    );
  }
}
