import 'package:flutter/material.dart';
import 'package:movies/core/widgets/share_button.dart';
import 'package:movies/features/home/presentation/view/widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  final int movieId;
  const MovieDetailsView({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
        actions: [ShareButton(text: 'eslamfares.com/details/$movieId')],
      ),
      body: MovieDetailsViewBody(movieId),
    );
  }
}
