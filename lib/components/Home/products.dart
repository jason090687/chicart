import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final double price;
  final double rating;
  final String imagePath;

  const ProductPage(
      {super.key,
      required this.title,
      required this.price,
      required this.imagePath,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Height of the container
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Scroll direction set to horizontal
        itemCount: 10, // Number of items
        itemBuilder: (context, index) {
          return Container(
            width: 160, // Width of each item
            margin: EdgeInsets.all(8.0), // Margin around each item
            color: Colors.blue, // Background color of each item
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
