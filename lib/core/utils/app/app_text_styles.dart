import 'app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  //==============================default=========================
  static const TextStyle font22Bold =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
//================14================================
  static const TextStyle font14GrayW600 = TextStyle(
    fontSize: 14,
    color: AppColors.gray,
    fontWeight: FontWeight.w600,
  );
  //================16================================
  static const TextStyle font16GrayDarkW700 = TextStyle(
    fontSize: 16,
    color: AppColors.graydark,
    fontWeight: FontWeight.w700,
  );
//================18================================
  static const TextStyle font18BlueDarkW700 = TextStyle(
    fontSize: 18,
    color: AppColors.blueDark,
    fontWeight: FontWeight.w700,
  );

  //================================22================================
  static const TextStyle font22BlueDarkW900 = TextStyle(
    fontSize: 20,
    color: AppColors.blueDark,
    fontWeight: FontWeight.w900,
  );
}
