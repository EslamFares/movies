import 'package:movies/features/home/domain/entity/movie_entity.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class FetchMovieLoading extends HomeState {}

final class FetchMovieSuccess extends HomeState {
  List<MovieEntity> moviesList;
  FetchMovieSuccess(this.moviesList);
}

final class FetchMovieFailure extends HomeState {
  final String message;
  FetchMovieFailure(this.message);
}
