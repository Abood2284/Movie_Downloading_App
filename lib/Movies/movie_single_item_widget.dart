import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './movie_provider.dart';
import './movie_model.dart';

class MovieSingleItemWidget extends StatelessWidget {
  // final String imageUrl;
  // final String title;

  // MovieSingleItemWidget(this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<MovieProvider>(context, listen: false);
    final List<Movie> movieList = movie.movie;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movieList.length,
      itemBuilder: (ctx, index) => Container(
        child: Stack(
          children: [
            ClipRRect(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                width: 250,
                child: Image.network(movieList[index].imageUrl),
              ),
            ),  
            Row(
              children: [
                Text(movieList[index].title,
                    style: Theme.of(context).textTheme.bodyText2),
                SizedBox(
                  width: 7,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
