import 'dart:ui';

import 'package:e_book/colorScheme.dart';
import 'package:flutter/material.dart';
class BookInfo extends StatelessWidget {
  const BookInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const bookInfo();
  }
}
class bookInfo extends StatefulWidget {
  const bookInfo({super.key});

  @override
  _bookInfoState createState() => _bookInfoState();
}

class _bookInfoState extends State<bookInfo> {
  var _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: 'book1.png',
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.65,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/book_info/book1.png'),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),

                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0.5,
                  right: 0.5,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.grey.shade200.withOpacity(0.5),
                          child: IconButton(
                            onPressed: () {
                              // Tambahkan aksi yang diinginkan di sini
                            },
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10,),
                const Text("The Jungle Book", style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 3,),
                const Text("Rudyard Kipling", style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 10,),
                Container(

                  child: const Row(
                    children: <Widget>[
                      Text("4.8", style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.w700
                      ),),
                      Text("(2458)", style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.w100
                      ),),
                    ],
                  ),
                ),
                const SizedBox(height:30),
                Slider(
                  min: 0,
                  max: 100,
                  inactiveColor: Colors.white,
                  activeColor: Colors.orange,
                  value: _value,
                  onChanged: (value){
                    setState(() {
                      _value = value;
                    });
                  },
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("00:00", style: TextStyle(
                        color: Colors.white
                    ),),
                    Text("35:30", style: TextStyle(
                        color: Colors.white
                    ),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

