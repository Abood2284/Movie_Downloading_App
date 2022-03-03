import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './_home_page.dart';
import './Movies/movie_provider.dart';
import './Movies/movie_detail_screen.dart';
import './Movies/movie_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MovieProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                bodyText2: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
        ),
        home: HomePage(),
        routes: {
          MovieDetailScreen.routeName : (ctx) => MovieDetailScreen(),
        },
      ),
    );
  }
}
