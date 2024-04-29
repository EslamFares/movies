import 'package:dartz/dartz.dart';
import 'package:movies/core/network/errors/failure.dart';
import 'package:movies/features/home/domain/entity/movie_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieEntity>>> getMovies();
}
