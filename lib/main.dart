import 'package:e_book/BookInfo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'welcome_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'reset_password.dart';
import 'home_page.dart';
import 'profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      themeMode: ThemeMode.dark,
      home: const WelcomePage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/reset_password': (context) => const ResetPasswordPage(),
        '/book_info': (context) => const BookInfo(),
        '/home': (context) => MyHomePage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
