import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = "en";
    options.headers['Authorization'] =
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1OTM3MjJiMTc1MDAyNTcyNGQ3NmQzM2MyNjhjNjFlMCIsInN1YiI6IjY2MmY5MTgyNjBiNThkMDEyM2RlZTk2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gq6L1vqZslSpn7bhYEM5TT2IwluWE0zuVpW1kP9kID4";
    options.headers['accept'] = "application/json";
    super.onRequest(options, handler);
  }
}
