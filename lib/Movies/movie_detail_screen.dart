import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './movie_provider.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = 'movie-detail-screen';
  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)?.settings.arguments as String; // Taking id of movie as input
    final fetchedMovie = Provider.of<MovieProvider>(context).findById(movieId); // Fetching single movie based on the id we recieved
    return Scaffold(
      appBar: AppBar(
        title: Text(fetchedMovie.title),
      ),
    );
  }
}
