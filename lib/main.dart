import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homePage.dart';
import 'form.dart';

void main() {
  runApp(MyApp());
}

bool isLoggedIn = false;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, accentColor: Colors.amberAccent),
      home: isLoggedIn ? App() : LoginDemo(),
    );
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('password');
    print(userId);
    if (userId != null) {
      setState(() {
        isLoggedIn = true;
      });
      print(isLoggedIn);
    }
  }
}
