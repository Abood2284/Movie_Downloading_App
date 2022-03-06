import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = [
    Movie(
      id: 'm1',
      title: 'Golmaal 4',
      description: 'Best comedy movie by actor Ajay devgan',
      rating: '4.3/5',
      imageUrl:
          'http://placekitten.com/200/300',
    ),
    Movie(
      id: 'm2',
      title: 'Golmaal 3',
      description: 'Best comedy movie by actor Ajay devgan',
      rating: '4.1/5',
      imageUrl:
          'http://placekitten.com/200/300',
    ),
    Movie(
      id: 'm3',
      title: 'Golmaal 2',
      description: 'Best comedy movie by actor Ajay devgan',
      rating: '4.0/5',
      imageUrl:
          'http://placekitten.com/200/300',
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
