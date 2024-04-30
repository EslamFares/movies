import 'package:flutter/material.dart';
import 'package:movies/core/utils/app/app_text_styles.dart';
import 'package:movies/core/utils/extensions/spacing_extensions.dart';
import 'package:movies/core/widgets/shimmer_network_img.dart';
import 'package:movies/core/widgets/tilte_text.dart';
import 'package:movies/features/home/domain/entity/movie_entity.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:movies/features/home/presentation/view/widgets/movie_rate.dart';

class MoviesDetailsItem extends StatelessWidget {
  const MoviesDetailsItem({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    MovieEntity movie = HomeCubit.get(context).moviesList[movieId];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShimmerNetworkImg(
            movie.imgpath,
            height: 250,
            width: context.width,
          ),
          TilteText(movie.moveTitle, alignment: Alignment.center),
          MovieRate(rating: movie.movieRate, totalRate: movie.movieRateCount),
          spaceVertical(10),
          Text(movie.moviedate, style: AppTextStyles.font14GrayW600),
          spaceVertical(50),
          Text(movie.movieDes, style: AppTextStyles.font16GrayDarkW700),
        ],
      ),
    );
  }
}
