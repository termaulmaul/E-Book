import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'book_detail_page.dart';
import 'profile_page.dart'; // Import halaman profil

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> books = [
    {
      'image': 'assets/images/best_seller/book1.png',
      'title': 'Harry Potter and the Goblet of Fire',
      'author': 'J.K. Rowling',
      'synopsis': 'Synopsis for Harry Potter and the Goblet of Fire...',
    },
    {
      'image': 'assets/images/best_seller/book2.png',
      'title': 'The Summoning (Shadowlands)',
      'author': 'Kelley Armstrong',
      'synopsis': 'Synopsis for The Summoning...',
    },
    {
      'image': 'assets/images/best_seller/book3.png',
      'title': 'Harry Potter and the Prisoner of Azkaban',
      'author': 'J.K. Rowling',
      'synopsis': 'Synopsis for Harry Potter and the Prisoner of Azkaban...',
    },
    {
      'image': 'assets/images/best_seller/book4.png',
      'title': 'Placeholder Title 4',
      'author': 'Author D',
      'synopsis':
          'In this thrilling installment, the characters must confront their pasts while battling present dangers. The plot is intricately woven, with each chapter revealing new secrets and surprises. The authors attention to detail and vivid descriptions bring the story to life, making the reader feel as though they are part of the adventure. This book is a rollercoaster of emotions, with heart-pounding action and deeply moving moments.',
    },
    {
      'image': 'assets/images/best_seller/book5.png',
      'title': 'Placeholder Title 5',
      'author': 'Author E',
      'synopsis':
          'The fifth book offers a fresh perspective on the ongoing saga, with new characters and settings adding depth to the story. The author expertly blends fantasy and reality, creating a world that feels both familiar and fantastical. The plot is filled with unexpected twists, keeping the reader on their toes. This book is a testament to the authors creativity and storytelling prowess, delivering a captivating and unforgettable reading experience.',
    },
    {
      'image': 'assets/images/best_seller/book6.png',
      'title': 'Placeholder Title 6',
      'author': 'Author F',
      'synopsis':
          'This book delves into the darker aspects of the story, exploring themes of betrayal, redemption, and the struggle for power. The authors nuanced portrayal of characters adds depth to the narrative, making their motivations and actions feel real and relatable. The plot is fast-paced and thrilling, with each chapter building on the tension and excitement. This book is a masterclass in storytelling, combining action, emotion, and intrigue in a seamless and engaging way.',
    },
    {
      'image': 'assets/images/best_seller/book7.png',
      'title': 'Placeholder Title 7',
      'author': 'Author G',
      'synopsis':
          'In this book, the story takes a surprising turn, with the protagonists facing their greatest challenge yet. The authors skillful storytelling keeps the reader engaged, as they navigate the complex plot and rich character development. The book is filled with memorable moments and powerful emotions, making it a must-read for fans of the series. The authors ability to create a compelling and immersive reading experience shines through in every page.',
    },
    {
      'image': 'assets/images/best_seller/book8.png',
      'title': 'Placeholder Title 8',
      'author': 'Author H',
      'synopsis':
          'The eighth book in the series continues to build on the rich world and complex characters established in previous installments. The plot is filled with intrigue and suspense, with each chapter revealing new secrets and surprises. The authors attention to detail and vivid descriptions bring the story to life, making the reader feel as though they are part of the adventure. This book is a testament to the authors creativity and storytelling prowess, delivering a captivating and unforgettable reading experience.',
    },
    {
      'image': 'assets/images/best_seller/book9.png',
      'title': 'Placeholder Title 9',
      'author': 'Author I',
      'synopsis':
          'In this installment, the characters must navigate a complex web of alliances and betrayals, with the fate of their world hanging in the balance. The authors masterful storytelling keeps the reader engaged, as they navigate the twists and turns of the plot. The book is filled with memorable moments and powerful emotions, making it a must-read for fans of the series. The authors ability to create a compelling and immersive reading experience shines through in every page.',
    },
    {
      'image': 'assets/images/best_seller/book10.png',
      'title': 'Placeholder Title 10',
      'author': 'Author J',
      'synopsis':
          'The final book in the series brings the story to a thrilling and satisfying conclusion. The author expertly weaves together the various plot threads, creating a cohesive and compelling narrative. The characters face their ultimate challenges, with the stakes higher than ever. The book is filled with heart-pounding action, emotional depth, and unexpected twists. This book is a fitting end to the series, leaving the reader both satisfied and wanting more.',
    },
  ];

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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            book['image']!,
            fit: BoxFit.cover,
            width: 150, // Adjust the width as needed
            height: 200, // Adjust the height as needed
          ),
        ),
      ),
    );
  }

  Widget bestSellerWidget(Map<String, String> book) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              book['image']!,
              height: 100,
              width: 70,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book['title']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(book['author']!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$9.99'), // Placeholder price
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          Text('4.5'), // Placeholder rating
                          Text(' (200)'), // Placeholder reviews
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
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: <Widget>[
            Text(
              "BO",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            Column(
              children: <Widget>[
                Text(
                  "O",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                Container(
                  height: 3,
                  width: 15,
                  color: Colors.white,
                )
              ],
            ),
            Text(
              "KLY",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
          ],
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
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 100), // Adjust bottom padding to accommodate floating navbar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    height: 230,
                    viewportFraction: 0.6,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                  ),
                  items: books.map((book) => bookImageWidget(book)).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  "Best Seller",
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return bestSellerWidget(books[index]);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blueGrey[800], // Adjust color as needed
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Implement action to navigate to home or do something else
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Implement action to handle favorites or do something else
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Navigate to ProfilePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Implement action to navigate to settings or do something else
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
