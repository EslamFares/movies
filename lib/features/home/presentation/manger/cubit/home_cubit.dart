import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/domain/repos/home_repo.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  //================================

  Future<void> getMovies() async {
    emit(FetchMovieLoading());
    final res = await homeRepo.getMovies();

    res.fold((failure) => emit(FetchMovieFailure(failure.message)),
        (moviesList) => emit(FetchMovieSuccess(moviesList)));
  }
}
