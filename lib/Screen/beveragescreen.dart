import 'package:flutter/material.dart';
import 'package:pages/details.dart';
import 'package:pages/main.dart';
import 'package:pages/navbar/cart/cart.dart';

class BeverageScreen extends StatefulWidget {
  const BeverageScreen({super.key});

  @override
  _BeverageScreenState createState() => _BeverageScreenState();
}

class _BeverageScreenState extends State<BeverageScreen> {
  late List<Map<String, dynamic>> _products = [];
  late final List<Map<String, dynamic>> _cart = [];
  late Future<Map<String, dynamic>> _fetchDataFuture;

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = fetchData().then((data) {
      setState(() {
        _products = data['results'][2]['maincategory_products']
            .cast<Map<String, dynamic>>();
      });
      return data;
    }).catchError((error) {
      print('Error fetching data: $error');
    });
  }
 void _addToCart(BuildContext context, Map<String, dynamic> product) {
    print('Added ${product['content_name']} to cart.');
    setState(() {
      _cart.add(product);
    });
  }

  void addToCart(Map<String, dynamic> product) {
    print('Added ${product['content_name']} to cart.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desserts'),
      ),
      body: _products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                final stringTitle = product['content_name'] ?? '';
                final String stringSub =
                    product['content_price'][0]['saleprice'] ?? '';
                final List contentImage = product['content_image'] ?? [];
                final url = contentImage.isNotEmpty
                    ? contentImage[0]['thumbnail_image']
                    : null;

                return ProductTile(
                  title: stringTitle,
                  subtitle: "Price $stringSub",
                  imageUrl: url,
                   onTap: () {
                    _addToCart(context,product);
                  },
                );
              },
            ),
             floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddToCartScreen(products: _cart),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}