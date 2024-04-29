import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/network/api/api_service.dart';
import 'package:movies/features/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:movies/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:movies/features/home/domain/repos/home_repo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: TextButton(
          onPressed: () async {
            HomeRepo homeRepo = HomeRepoImpl(
                homeRemoteDataSource:
                    HomeRemoteDataSourceImpl(ApiService(dio: Dio())));

            final res = await homeRepo.getMovies();
            res.fold((l) => debugPrint('lllllll: ${l.message}'),
                (r) => debugPrint("RRRRRRRRRR=> ${r.length}"));
          },
          child: const Text('click'),
        ),
      ),
    );
  }
}
