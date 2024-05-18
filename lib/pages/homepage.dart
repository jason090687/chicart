import 'package:chicart/components/Home/products.dart';
import 'package:chicart/components/Home/search_fields.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove app bar shadow
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchField(),
            const SizedBox(height: 20),
            const Text('Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              child: Row(
                children: [
                  _buildCategoryButton('All', true), // 'All' button selected
                  _buildCategoryButton('Headphones'),
                  _buildCategoryButton('Smartwatch'),
                  _buildCategoryButton('Phone'),
                  _buildCategoryButton('Laptop'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('All Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              // Make the product list take up remaining space
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: const [
                  ProductPage(
                      title: 'Apple Beats Solo3',
                      price: 5000,
                      imagePath: 'assets/item1.png',
                      rating: 4.5)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category, [bool isSelected = false]) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(category,
          style: TextStyle(color: isSelected ? Colors.white : Colors.grey)),
    );
  }
}
