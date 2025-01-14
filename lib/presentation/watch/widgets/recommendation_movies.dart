import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/common/widgets/movie/movie_card.dart';
import 'package:netflix_app/presentation/watch/bloc/recommendation_movies_cubit.dart';
import 'package:netflix_app/presentation/watch/bloc/recommendation_movies_state.dart';

class RecommendationMovies extends StatelessWidget {
  const RecommendationMovies({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecommendationMoviesCubit()..getRecommendationMovies(movieId),
      child: BlocBuilder<RecommendationMoviesCubit, RecommendationMoviesState>(
        builder: (context, state) {
          if (state is RecommendationMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is RecommendationMoviesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommendations',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.movies[index]);
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.movies.length,
                  ),
                ),
              ],
            );
          }
          if (state is FailureLoadRecommendationMovies) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
