import 'package:flutter/material.dart';
import 'form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primaryColorDark: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent
      ),
      title: 'Movies Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, accentColor: Colors.amberAccent),
      home: LoginDemo(),
    );
  }
}
