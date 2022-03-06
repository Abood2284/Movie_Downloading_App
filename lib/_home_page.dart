import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/movie_provider.dart';
import './widgets/movie_single_item_widget.dart';
import './models/movie_model.dart';
import './screens/movie_detail_screen.dart';

class HomePage extends StatelessWidget {
  final _searchBarText = TextEditingController;

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final movieObject =
        movieProvider.movie; // Storing the list of movies in movieObject
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clickex Movie App'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(movieObject),
              ).then((value) => Navigator.of(context).pushNamed(
                  MovieDetailScreen.routeName,
                  arguments: value.id));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(3),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
          ),

          /// * passing movie object at current index of movieObject as it stores list of movie object
          itemBuilder: (ctx, index) => MovieSingleItemWidget(
                // movieProvider.movie[index].imageUrl,
                // movieProvider.movie[index].title,
                movieObject[index],
              ),
          itemCount: movieObject.length),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<Movie> movie;
  CustomSearchDelegate(this.movie);

  @override
  List<Widget>? buildActions(BuildContext context) {
    /// This 'X' icon will at the trailing of the search bar and pressing this eill clear the query
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override

  /// * What you want to show at the starting of the Search Bar
  Widget? buildLeading(BuildContext context) {
    // This arrow_back icon will close the search bar
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          // Close takes context and The value provided for result is used as the return value of the call to [showSearch] that launched the search initially ->  we dont need that value so null
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
   if (movie.isEmpty) {
      return const Center(
        child: Text('No Data could be Fetch at the Moment'),
      );
    }
    final result = movie
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (ctx, index) => ListTile(
              title: Text(result[index].title, style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 22, color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.cloud_upload_rounded),
              onTap: () {
              Navigator.of(context).pushNamed(MovieDetailScreen.routeName,
                    arguments: result[index].id);
              },
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (movie.isEmpty) {
      return const Center(
        child: Text('No Data could be Fetch at the Moment'),
      );
    }
    final result = movie
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (ctx, index) => ListTile(
              title: Text(result[index].title),
              onTap: () {
                query = result[index].title;
              },
            ));
  }
}
