// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import 'package:todo/todo_model.dart';

// class MovieService extends ChangeNotifier {
//   final List<MovieModel> _movies = [];
//   bool switchTheme = false;
//   var box = Hive.box('settings'); // hive box

//   List<MovieModel> get movies => _movies;

//   void addMovie(MovieModel movie) {
//     _movies.add(movie);
//     notifyListeners();
//   }

//   void deleteMovie(MovieModel movie) {
//     _movies.remove(movie);
//     notifyListeners();
//   }

//   void updateMovie(MovieModel movie) {
//     int index = _movies.indexWhere((element) => element.id == movie.id);
//     _movies[index] = movie;
//     notifyListeners();
//   }

//   void deleteAllMovies() {
//     _movies.clear();
//     notifyListeners();
//   }

//   void switchThemeMode() {
//     switchTheme = !switchTheme;
//     box.put('theme', !switchTheme);
//     notifyListeners();
//   }
// }
