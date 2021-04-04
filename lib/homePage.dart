import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_hub/movieCard.dart';
import 'package:movies_hub/models/movies.dart';
import 'package:cool_alert/cool_alert.dart';

final searchController = TextEditingController();

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  bool typing = false;
  List<Movie> _movies = [];
  String s = '' != null ? 'prince' : searchController.text;

  @override
  void initState() {
    super.initState();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    try {
      final movies = await _fetchAllMovies();
      setState(() {
        _movies = movies;
      });
    } catch (e) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.info,
        text: "No results found",
      );
    }
  }

  Future<List<Movie>> _fetchAllMovies() async {
    final response = await http.get(Uri.parse("https://www.omdbapi.com/?s=" + s + "&apikey=564727fa"));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: typing ? TextBox() : Text("Movies Hub"),
              leading: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    typing = !typing;
                    s = searchController.text;
                    if (s != '') {
                      _populateAllMovies();
                    }
                  });
                },
              ),
            ),
            body: MoviesWidget(movies: _movies)));
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        controller: searchController,
        autofocus: false,
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Search',
        ),
      ),
    );
  }
}
