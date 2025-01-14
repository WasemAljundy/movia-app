import 'package:flutter/material.dart';
import 'package:netflix_app/common/widgets/appbar/app_bar.dart';
import 'package:netflix_app/domain/movie/entities/movie.dart';
import 'package:netflix_app/presentation/watch/widgets/recommendation_movies.dart';
import 'package:netflix_app/presentation/watch/widgets/video_overview.dart';
import 'package:netflix_app/presentation/watch/widgets/video_player.dart';
import 'package:netflix_app/presentation/watch/widgets/video_release_date.dart';
import 'package:netflix_app/presentation/watch/widgets/video_title.dart';
import 'package:netflix_app/presentation/watch/widgets/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  const MovieWatchPage({required this.movieEntity, super.key});

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(height: 20),
            VideoTitle(title: movieEntity.title!),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
              ],
            ),
            const SizedBox(height: 20),
            VideoOverview(overview: movieEntity.overview!),
            const SizedBox(height: 20),
            RecommendationMovies(movieId: movieEntity.id!),
          ],
        ),
      ),
    );
  }
}
