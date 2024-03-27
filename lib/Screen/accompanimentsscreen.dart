import 'package:flutter/material.dart';
import 'package:pages/details.dart';
import 'package:pages/main.dart';
import 'package:pages/navbar/cart/cart.dart';

class AccompanimentsScreen extends StatefulWidget {
  const AccompanimentsScreen({super.key});

  @override
  _AccompanimentsScreenState createState() => _AccompanimentsScreenState();
}

class _AccompanimentsScreenState extends State<AccompanimentsScreen> {
   late List<Map<String, dynamic>> _products = [];
  late final List<Map<String, dynamic>> _cart = [];
  

  @override
  void initState() {
    super.initState();
    fetchData().then((data) {
      setState(() {
        _products = data['results'][1]['maincategory_products']
            .cast<Map<String, dynamic>>();
      });
    }).catchError((error) {
      print('Error fetching data: $error');
    });
  }

   void _addToCart(BuildContext context, Map<String, dynamic> product) {
    print('Added ${product['content_name']} to cart.');
    setState(() {
      _cart.add(product);
    }); final snackBar = SnackBar(
    content: Text('${product['content_name']} added to cart!'),
    backgroundColor: Colors.amber,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
  void addToCart(Map<String, dynamic> product) {
    print('Added ${product['content_name']} to cart.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accompaniments'),
      ),
      body: _products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                final stringTitle = product['content_name'];
                final String stringSub =
                    product['content_price'][0]['saleprice'];
                return ProductTile(
                  title: stringTitle,
                  subtitle: 'Price: \$${stringSub}',
                  imageUrl: product['content_image'][0]['thumbnail_image'],
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
