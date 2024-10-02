import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'detail_product_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6D4C41),
        title: const Text(
          'Jacobs Jewelry',
          style: TextStyle(
            fontFamily: 'Serif',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4AF37),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xFFD4AF37)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: username),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildPoster('assets/poster1.jpeg'),
                  _buildPoster('assets/poster2.jpeg'),
                  _buildPoster('assets/poster3.jpeg'),
                  _buildPoster('assets/poster4.jpeg'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, $username!',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif',
                color: Color(0xFF6D4C41),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              children: [
                _buildProductCard(
                  context,
                  'Gold Necklace',
                  'assets/item1.jpg',
                  500.0,
                  4.8,
                  'A stunning gold necklace crafted with the finest details.',
                ),
                _buildProductCard(
                  context,
                  'Diamond Ring',
                  'assets/item2.jpg',
                  1200.0,
                  4.9,
                  'An exquisite diamond ring, perfect for special moments.',
                ),
                _buildProductCard(
                  context,
                  'Silver Bracelet',
                  'assets/item3.jpg',
                  300.0,
                  4.7,
                  'A delicate silver bracelet that adds elegance to any outfit.',
                ),
                _buildProductCard(
                  context,
                  'Pearl Earrings',
                  'assets/item4.jpg',
                  800.0,
                  4.6,
                  'Beautiful pearl earrings that exude timeless beauty.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoster(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 120,
        ),
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String productName,
    String image,
    double price,
    double rating,
    String description,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5,
      shadowColor: Colors.black38,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            productName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Serif',
              color: Color(0xFF6D4C41),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Price: \$$price',
            style: const TextStyle(
              color: Color(0xFFD4AF37),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 5),
              Text(
                rating.toString(),
                style: const TextStyle(
                  color: Color(0xFF6D4C41),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProductPage(
                    productName: productName,
                    productImage: image,
                    productPrice: price,
                    productRating: rating,
                    productDescription: description,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4AF37),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            ),
            child: const Text(
              'Buy',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
