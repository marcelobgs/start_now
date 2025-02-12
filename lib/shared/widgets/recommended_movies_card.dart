import 'package:flutter/material.dart';

import '../../models/movies.dart';
import '../themes/app_colors.dart';
import '../themes/app_texts.dart';

class RecommendedMoviesCard extends StatelessWidget {
  final Results resultsMovies;

  const RecommendedMoviesCard({Key? key, required this.resultsMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("MovieID ${resultsMovies.id}");
        Navigator.pushNamed(context, "/movie_details", arguments: resultsMovies.id.toString());
      },
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.only(right: 10),
            child: Image.network(
              "https://image.tmdb.org/t/p/original/${resultsMovies.backdropPath}",
              height: 150,
              loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } 
                return Container(
                  color: AppColors.loadimage,
                  height: 150,
                  width: 250,
                  child: const Center(child: Text("Carregando...")),
                );
              }, 
            ),
          ),
          SizedBox(width: 250, child: Text("${resultsMovies.title}", style: AppTexts.title, overflow: TextOverflow.ellipsis,)),
        ],
      ),
    );
  }
}