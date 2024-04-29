import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/domain/entity/movie_entity.dart';
import 'package:movies/features/home/domain/repos/home_repo.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  //================================
  List<MovieEntity> moviesList = [];
  Future<void> getMovies() async {
    emit(FetchMovieLoading());
    final res = await homeRepo.getMovies();

    res.fold((failure) => emit(FetchMovieFailure(failure.message)),
        (moviesListComening) {
      moviesList = moviesListComening;
      emit(FetchMovieSuccess(moviesListComening));
    });
  }
}
