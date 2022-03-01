import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Movies/movie_provider.dart';
import './Movies/movie_model.dart';
import './Movies/movie_single_item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<MovieProvider>(context, listen: false);
    final List<Movie> movies = movie.genereMovies('comedy');
    final int m = movies.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clickex Movie App'),
      ),
      body: ListView.builder(
          itemCount: m,
          itemBuilder: (ctx, index) {
            return Container(
              child: MovieSingleItemWidget(),
              height: 160,
            );
          }),
      // ListView(
      //   children: [
      //     Container(
      //         width: double.infinity,
      //         padding: const EdgeInsets.all(4),
      //         color: Colors.red,
      //         margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
      //         child: const Text(
      //           "Mario",
      //           style: TextStyle(fontSize: 24, color: Colors.white),
      //         )),
      //     Container(
      //       height: 160,
      //       child: MovieSingleItemWidget(),
      //     )
      //   ],
      // ),
    );
  }
}
