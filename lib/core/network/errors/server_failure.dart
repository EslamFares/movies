import 'package:dio/dio.dart';
import 'package:movies/core/network/errors/failure.dart';
import 'package:movies/core/network/errors/handel_dio_exceptions.dart';

class ServerFailure extends Failure {
  //implements Exception
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException e) {
    return handelDioExceptions(e);
  }
}

//n DioException catch (e) {
//   return Left(ServerFailure.fromDioError(e));
// } catch (e) {
//   return left(ServerFailure(e.toString()));
// }
