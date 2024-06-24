import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart'; // Import library faker
import 'colorScheme.dart';
import 'book_detail_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> books = List.generate(10, (index) {
    Faker faker = Faker();
    return {
      'image': 'assets/images/best_seller/book${index + 1}.png',
      'title': 'Book ${index + 1}',
      'author': faker.person.name(),
      'synopsis': faker.lorem.sentences(5).join(' '), // Generates 5 random sentences for synopsis
    };
  });

  Widget bookImageWidget(Map<String, String> book) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailPage(
              imagePath: book['image']!,
              title: book['title']!,
              author: book['author']!,
              synopsis: book['synopsis']!,
            ),
          ),
        );
      },
      child: Image.asset(book['image']!, fit: BoxFit.cover),
    );
  }

  Widget bestSellerWidget(String imagePath, String title, String author, String price, String rating, String reviews) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset('assets/images/best_seller/$imagePath', height: 100, width: 70, fit: BoxFit.cover),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(author),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$$price'),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          Text(rating),
                          Text(' ($reviews)'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          child: Row(
            children: <Widget>[
              Text("BO", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900
              )),
              Column(
                children: <Widget>[
                  Text("O",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900
                  )),
                  Container(
                    height: 3,
                    width: 15,
                    color: Colors.white,
                  )
                ],
              ),
              Text("KLY", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900
              )),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              // Tambahkan aksi yang diinginkan di sini
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 230,
                      viewportFraction: 0.44,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                    ),
                    items: books.map((book) => bookImageWidget(book)).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Text("Best Seller", style: TextStyle(
                    fontFamily: 'montserrat',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                )),
                SizedBox(height: 20),
                Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      for (int i = 0; i < books.length; i++)
                        bestSellerWidget(
                          'book${i + 1}.png', // Example imagePath, adjust as per your requirement
                          books[i]['title']!,
                          books[i]['author']!,
                          (6.99 + i * 2).toStringAsFixed(2), // Example price calculation
                          (4.5 + i * 0.1).toStringAsFixed(1), // Example rating calculation
                          (200 + i * 20).toString(), // Example reviews calculation
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
