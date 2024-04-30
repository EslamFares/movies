import 'package:flutter/material.dart';
import 'package:movies/core/utils/app/app_colors.dart';
import 'package:movies/core/utils/app/app_text_styles.dart';
import 'package:movies/core/utils/extensions/spacing_extensions.dart';
import 'package:movies/core/widgets/shimmer_network_img.dart';
import 'package:movies/features/home/domain/entity/movie_entity.dart';
import 'package:movies/features/home/presentation/view/widgets/movie_rate.dart';

class MovieItem extends StatelessWidget {
  final Function onTap;
  final String img;
  final String name;
  final String date;
  final double rate;
  final int totalRate;

  const MovieItem({
    super.key,
    required this.img,
    required this.name,
    required this.date,
    required this.rate,
    required this.totalRate,
    required this.moviesList,
    required this.onTap,
  });

  final List<MovieEntity> moviesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: context.width,
      child: Card(
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () => onTap(),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  ShimmerNetworkImg(img),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          name,
                          style: AppTextStyles.font18BlueDarkW700,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Text(date,
                                  style: AppTextStyles.font14GrayW600)),
                          MovieRate(rating: rate, totalRate: totalRate)
                        ],
                      ),
                    ],
                  )),
                ],
              ),
            ),
          )),
    );
  }
}
