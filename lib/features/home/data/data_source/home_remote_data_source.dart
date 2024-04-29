import 'package:movies/features/home/domain/entity/movie_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> getMovies();
}
