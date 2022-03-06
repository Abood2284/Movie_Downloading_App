import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';
import '../models/movie_model.dart';
import '../screens/movie_detail_screen.dart';

class MovieSingleItemWidget extends StatelessWidget {
  // final String imageUrl;
  // final String title;

  // MovieSingleItemWidget(this.imageUrl, this.title);

  final Movie movieIndex; /// Getting the movie object at the current index of Grid Builder
  MovieSingleItemWidget(this.movieIndex);

  @override
  Widget build(BuildContext context) {
    // final movieProvider = Provider.of<Movie>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(MovieDetailScreen.routeName,
                  arguments: movieIndex.id);  // Passing the id of that movie Object so that next screen can get the object based on id
            },
            child: Image.network(movieIndex.imageUrl, fit: BoxFit.cover)),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            movieIndex.title,
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}
