import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/functions/movie_index.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_state.dart';
import 'package:movies/features/home/presentation/view/widgets/movies_details_body.dart';

class MovieDetailsViewBody extends StatelessWidget {
  final int movieId;
  const MovieDetailsViewBody(this.movieId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: movieId < 0 ||
                    movieId > HomeCubit.get(context).moviesList.length ||
                    movieIndex(movieId.toString()) == -1
                ? const Center(
                    child: Text(
                        "oops! not valied Movies Id \n That is no Movie Found"))
                :
                // state is FetchMovieSuccess &&
                HomeCubit.get(context).moviesList.isNotEmpty
                    ? MoviesDetailsBody(movieId: movieId)
                    : state is FetchMovieFailure
                        ? Center(
                            child:
                                Text("Opps! an error occured${state.message}"))
                        : const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
