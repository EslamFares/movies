import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/network/api/api_service.dart';
import 'package:movies/features/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/features/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:movies/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:movies/features/home/domain/repos/home_repo.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  /// dio
  Dio dio = Dio();

  /// apiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: dio));

  /// remote data
  getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(api: getIt<ApiService>()));

  ///home repo
  getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(homeRemoteDataSource: getIt<HomeRemoteDataSource>()));
}
