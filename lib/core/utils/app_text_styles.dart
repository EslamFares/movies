import '../utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  //==============================default=========================
  static const TextStyle font22Bold =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  //================================22================================
  static const TextStyle font22BlueDarkW900 = TextStyle(
    fontSize: 20,
    color: AppColors.blueDark,
    fontWeight: FontWeight.w900,
  );
}
