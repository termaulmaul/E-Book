import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:e_book/reset_password.dart';
import 'main.dart';
import 'home_page.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<User?> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
    return userCredential.user;
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
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
      appBar: AppBar(title: Text('Login')),
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
            ElevatedButton.icon(
              onPressed: _signInWithEmailAndPassword,
              icon: Icon(Icons.email),
              label: Text('Login with Email'),
            ).animate().slide(),
            ElevatedButton.icon(
              onPressed: _signInWithGoogle,
              icon: Image.asset('assets/images/google.png', height: 24), // Menggunakan logo Google
              label: Text('Login with Google'),
            ).animate().slide(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                );
              },
              child: Text('Forgot Password?'),
            ).animate().fadeIn(),
          ],
        ),
      ),
    );
  }
}
