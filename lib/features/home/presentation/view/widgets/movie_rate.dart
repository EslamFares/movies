import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_text_styles.dart';

class MovieRate extends StatelessWidget {
  const MovieRate({
    super.key,
    required this.rating,
    required this.totalRate,
  });

  final double rating;
  final int totalRate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        Text(' ${rating.toStringAsFixed(1)}  ',
            style: AppTextStyles.font18BlueDarkW700),
        Text('($totalRate)', style: AppTextStyles.font14GrayW600),
      ],
    );
  }
}
