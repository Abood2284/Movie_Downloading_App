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
          'https://pixabay.com/get/g20069f5c94dd79811127066b2943a530a5db9f9bc44d47170b1eda2de43471ea6cd8e46ab6febbe2bf668eb644b4cde195dbf5c52d0a97adce9474ca5a3d6e0c8a46d0d9beee827d1f5fbc656cedcf2f_1920.png',
    ),
    Movie(
      id: 'm2',
      title: 'Golmaal 3',
      description: 'Best comedy movie by actor Ajay devgan',
      rating: '4.1/5',
      imageUrl:
          'https://pixabay.com/get/g20069f5c94dd79811127066b2943a530a5db9f9bc44d47170b1eda2de43471ea6cd8e46ab6febbe2bf668eb644b4cde195dbf5c52d0a97adce9474ca5a3d6e0c8a46d0d9beee827d1f5fbc656cedcf2f_1920.png',
    ),
    Movie(
      id: 'm3',
      title: 'Golmaal 2',
      description: 'Best comedy movie by actor Ajay devgan',
      rating: '4.0/5',
      imageUrl:
          'https://pixabay.com/get/g20069f5c94dd79811127066b2943a530a5db9f9bc44d47170b1eda2de43471ea6cd8e46ab6febbe2bf668eb644b4cde195dbf5c52d0a97adce9474ca5a3d6e0c8a46d0d9beee827d1f5fbc656cedcf2f_1920.png',
    ),
  ];

  List<Movie> get movie {
    return [..._movies];
  }

  int get totalMovies {
    return _movies.length;
  }
  Movie findById(String id){
    return movie.firstWhere((mov) => mov.id == id);
  }
}
