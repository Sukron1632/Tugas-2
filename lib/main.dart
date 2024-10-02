import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'detail_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const LoginPage());
          case '/home':
            final String username = settings.arguments as String;
            return MaterialPageRoute(builder: (context) => HomePage(username: username));
          case '/profile':
            final String username = settings.arguments as String;
            return MaterialPageRoute(builder: (context) => ProfilePage(username: username));
          case '/detail_product':
            final Map<String, dynamic> productData = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => DetailProductPage(
                productName: productData['productName'],
                productImage: productData['productImage'],
                productPrice: productData['productPrice'],
                productRating: productData['productRating'],
                productDescription: productData['productDescription'],
              ),
            );
          default:
            return MaterialPageRoute(builder: (context) => const LoginPage());
        }
      },
    );
  }
}
