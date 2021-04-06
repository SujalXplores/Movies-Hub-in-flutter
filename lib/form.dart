import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homePage.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  String _id = "4234";
  String _pass = "sujalshah";
  final idController = TextEditingController();
  final passController = TextEditingController();
  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.yellow[200]),
        child: Form(
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0, bottom: 60.0),
                  child: Center(
                    child: Container(
                        width: 120, height: 70, child: Image.asset('icon.png')),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: idController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.perm_identity_outlined),
                      border: OutlineInputBorder(),
                      labelText: 'ID'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 30, bottom: 40),
                child: TextFormField(
                    obscureText: isHide,
                    controller: passController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outlined),
                        suffixIcon: IconButton(
                          icon: isHide
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility_outlined),
                          onPressed: () {
                            setState(() {
                              isHide = !isHide;
                            });
                          },
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password')),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if (idController.text == _id &&
                        passController.text == _pass) {
                      loginUser();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Access Granted.'),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => App()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Access Denied !'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Powered by Sujal Shah"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', passController.text);
    passController.clear();
    idController.clear();
  }
}
