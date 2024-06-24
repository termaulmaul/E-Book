import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/book.png', height: 100)
              .animate()
              .fadeIn(), // Animasi pada Image
            SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Welcome to E-Book App',
                  textStyle: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
              totalRepeatCount: 1,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Login'),
            )
              .animate()
              .slide(), // Animasi pada ElevatedButton
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Register'),
            )
              .animate()
              .slide(), // Animasi pada ElevatedButton
          ],
        ),
      ),
    );
  }
}
