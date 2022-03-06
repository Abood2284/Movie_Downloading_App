import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/movie_provider.dart';
import 'models/movie_model.dart';
import 'widgets/movie_single_item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final movieObject = movieProvider.movie;  // Storing the list of movies in movieObject
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clickex Movie App'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(3),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
          ),
          /// * passing movie object ar current index of movieObject as it stores list of movie object
          itemBuilder: (ctx, index) => MovieSingleItemWidget(
              // movieProvider.movie[index].imageUrl,
              // movieProvider.movie[index].title,
              movieObject[index],
              ),
          itemCount: movieObject.length),
    );
  }
}
