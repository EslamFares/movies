import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widgets/shimmer_network_img.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(title: const Text('home')),
            body: state is FetchMovieSuccess
                ? ListView.builder(
                    itemBuilder: (context, index) => Card(
                        child: Row(
                      children: [
                        ShimmerNetworkImg(state.moviesList[index].imgpath),
                        Expanded(
                            child: Column(
                          children: [
                            Text(state.moviesList[index].moveTitle),
                            Text(state.moviesList[index].moviedate),
                          ],
                        )),
                      ],
                    )),
                    itemCount: state.moviesList.length,
                  )
                : state is FetchMovieFailure
                    ? Center(child: Text(state.message))
                    : const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
