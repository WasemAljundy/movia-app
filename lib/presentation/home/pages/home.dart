import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/common/widgets/appbar/app_bar.dart';
import 'package:netflix_app/core/configs/assets/app_vectors.dart';
import 'package:netflix_app/presentation/home/widgets/category_text.dart';
import 'package:netflix_app/presentation/home/widgets/now_playing_movies.dart';
import 'package:netflix_app/presentation/home/widgets/popular_tv.dart';
import 'package:netflix_app/presentation/home/widgets/trending_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trending 🔥'),
            TrendingMovies(),
            SizedBox(height: 20),
            CategoryText(title: 'Now Playing'),
            NowPlayingMovies(),
            SizedBox(height: 20),
            CategoryText(title: 'Popular Tv Shows'),
            SizedBox(height: 20,),
            PopularTv(),
          ],
        ),
      ),
    );
  }
}
