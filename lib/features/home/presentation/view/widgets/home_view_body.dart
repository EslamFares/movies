import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_state.dart';
import 'package:movies/features/home/presentation/view/widgets/movies_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: state is FetchMovieSuccess
                ? MoviesListView(moviesList: state.moviesList)
                : state is FetchMovieFailure
                    ? Center(
                        child: Text("Opps! an error occured${state.message}"))
                    : const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
