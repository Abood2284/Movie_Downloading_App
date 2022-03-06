import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import './_home_page.dart';
import 'providers/movie_provider.dart';
import 'screens/movie_detail_screen.dart';

void main() {
  // SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

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
        // title: 'DeliMeals',
        theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                bodyText2: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
        ),
        home: HomePage(),
        routes: {
          MovieDetailScreen.routeName: (ctx) => MovieDetailScreen(),
        },
      ),
    );
  }
}
