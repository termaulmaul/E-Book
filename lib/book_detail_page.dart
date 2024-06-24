import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String author;
  final String synopsis;

  const BookDetailPage({super.key, required this.imagePath, required this.title, required this.author, required this.synopsis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(imagePath, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('by $author', style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            const SizedBox(height: 20),
            Text(synopsis, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
