import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/router/my_routes.dart';
import 'package:movies/features/home/domain/entity/movie_entity.dart';
import 'package:movies/features/home/presentation/view/widgets/movie_item.dart';

class MoviesListView extends StatelessWidget {
  final List<MovieEntity> moviesList;
  const MoviesListView({
    super.key,
    required this.moviesList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MovieItem(
          onTap: () {
            GoRouter.of(context).push(MyRoutes.movieDetailsView, extra: index);
          },
          img: moviesList[index].imgpath,
          name: moviesList[index].moveTitle,
          date: moviesList[index].moviedate,
          rate: moviesList[index].movieRate,
          totalRate: moviesList[index].movieRateCount,
          moviesList: moviesList),
      itemCount: moviesList.length,
    );
  }
}
