import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'home_page.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ).animate().fadeIn(),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ).animate().fadeIn(),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ).animate().slide(),
          ],
        ),
      ),
    );
  }
}
