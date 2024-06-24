import 'package:e_book/BookInfo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'welcome_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'reset_password.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      themeMode: ThemeMode.dark,
      home: WelcomePage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/reset_password': (context) => ResetPasswordPage(),
        '/book_info': (context) => BookInfo(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}
