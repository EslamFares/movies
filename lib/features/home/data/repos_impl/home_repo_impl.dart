import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/network/errors/failure.dart';
import 'package:movies/core/network/errors/server_failure.dart';
import 'package:movies/features/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/features/home/domain/entity/movie_entity.dart';
import 'package:movies/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() async {
    List<MovieEntity> moviesList = [];
    try {
      moviesList = await homeRemoteDataSource.getMovies();
      return right(moviesList);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
