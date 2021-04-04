import 'package:flutter/material.dart';
import 'homePage.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  String id = "4234";
  String pass = "sujalshah";
  final idController = TextEditingController();
  final passController = TextEditingController();
  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0,bottom: 60.0),
              child: Center(
                child: Container(
                    width: 150, height: 100, child: Image.asset('icon.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: idController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'ID'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0, 
                right: 15.0, 
                top: 30, 
                bottom: 40
              ),
              child: TextField(
                obscureText: isHide,
                controller: passController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: isHide ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined),
                    onPressed: () {
                      setState(() {
                        isHide = !isHide;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Password'
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          if (this.id == idController.text && this.pass == passController.text) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => App()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Access denied.'),
              ),
            );
          }
        },
        child: Icon(Icons.login),
      ),
    );
  }
}
