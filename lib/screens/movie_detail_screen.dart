import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = 'movie-detail-screen';

  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)?.settings.arguments
        as String; // Taking id of movie as input
    final fetchedMovie = Provider.of<MovieProvider>(context)
        .findById(movieId); // Fetching single movie based on the id we recieved
    return Scaffold(
      appBar: AppBar(
        title: Text(fetchedMovie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.38,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  fetchedMovie.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(),
          ],
        ),
      ),
    );
  }
}
