import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String author;
  final String synopsis;

  BookDetailPage({required this.imagePath, required this.title, required this.author, required this.synopsis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(imagePath, height: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('by $author', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            SizedBox(height: 20),
            Text(synopsis, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
