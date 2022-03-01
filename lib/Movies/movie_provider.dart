import 'package:flutter/material.dart';

import './movie_model.dart';

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = [
    Movie(
        id: 'm1',
        title: 'Golmaal 4',
        description: 'Best comedy movie by actor Ajay devgan',
        rating: '4.3/5',
        imageUrl:
            'https://pixabay.com/get/g2367e312e5b444252dd1639ba9f27edfa04e269538d22d4a5f2e843639b0f535f61d3350bd66de32d1024443ed6ee872a11db93c9ddc14035a7e73a82a4e359ab8344f145d4097cf1be4f9ee642acaf7_1920.jpg',
        geneType: ['comedy', 'romance']),
    Movie(
        id: 'm2',
        title: 'Golmaal 3',
        description: 'Best comedy movie by actor Ajay devgan',
        rating: '4.1/5',
        imageUrl:
            'https://pixabay.com/get/g2367e312e5b444252dd1639ba9f27edfa04e269538d22d4a5f2e843639b0f535f61d3350bd66de32d1024443ed6ee872a11db93c9ddc14035a7e73a82a4e359ab8344f145d4097cf1be4f9ee642acaf7_1920.jpg',
        geneType: ['comedy']),
    Movie(
        id: 'm3',
        title: 'Golmaal 2',
        description: 'Best comedy movie by actor Ajay devgan',
        rating: '4.0/5',
        imageUrl:
            'https://pixabay.com/get/g2367e312e5b444252dd1639ba9f27edfa04e269538d22d4a5f2e843639b0f535f61d3350bd66de32d1024443ed6ee872a11db93c9ddc14035a7e73a82a4e359ab8344f145d4097cf1be4f9ee642acaf7_1920.jpg',
        geneType: ['comedy', 'action']),
  ];

  List<Movie> get movie {
    return [..._movies];
  }

  int get totalMovies {
    return _movies.length;
  }

  List<Movie> genereMovies(String gene) {
    return movie.where((mov) => mov.geneType.contains(gene)).toList();
  }
}
