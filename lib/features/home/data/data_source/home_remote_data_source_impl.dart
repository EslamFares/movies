import 'package:movies/core/network/api/api_consts.dart';
import 'package:movies/core/network/api/api_consumer.dart';
import 'package:movies/features/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/features/home/data/models/movies_model.dart';
import 'package:movies/features/home/domain/entity/movie_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiConsumer api;
  HomeRemoteDataSourceImpl({required this.api});
  @override
  Future<List<MovieEntity>> getMovies() async {
    List<MovieEntity> moviesList = [];
    var data = await api.get(path: ApiConsts.movies, query: {
      "include_adult": false,
      "include_video": false,
      "language": "en-US",
      "page": 1,
      "sort_by": "popularity.desc",
    });
    for (var movie in data['results']) {
      moviesList.add(MoviesModel.fromJson(movie));
    }
    return moviesList;
  }
}
