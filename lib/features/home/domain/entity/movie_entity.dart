class MovieEntity {
  final int moveId;
  final String moveTitle;
  final String movieDes;
  final String imgpath;
  final String postarPath;
  final double movieRate;
  final int movieRateCount;
  final String moviedate;

  MovieEntity(
      {required this.moveId,
      required this.moveTitle,
      required this.movieDes,
      required this.imgpath,
      required this.postarPath,
      required this.movieRate,
      required this.movieRateCount,
      required this.moviedate});
}
