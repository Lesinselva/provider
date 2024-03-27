import 'package:flutter/material.dart';
import 'package:pages/navbar/cart/cart.dart';
import 'package:provider/provider.dart';
import 'package:pages/details.dart';
import 'package:pages/main.dart';
import 'package:pages/navbar/cart/cartdetails.dart';
import 'package:pages/navbar/cart/changenotifier.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  late List<Map<String, dynamic>> _products = [];
  
  @override
  void initState() {
    super.initState();
    fetchData().then((data) {
      setState(() {
        _products =
            data['results'][0]['offer_products'].cast<Map<String, dynamic>>();
      });
    }).catchError((error) {
      print('Error fetching data: $error');
    });
  }
void _addToCart(BuildContext context, Map<String, dynamic> product) {
  print('Adding ${product['content_name']} to cart.');
  final cartProvider = Provider.of<CartProvider>(context, listen: false);
  print('ads ${cartProvider.cartItems}');
  cartProvider.addToCart(
    CartItem(
      title: product['content_name'],
      subtitle: 'Price: \$${product['content_price'][0]['saleprice']}',
      imageUrl: product['content_image'][0]['thumbnail_image'],
    ),
  );

  final snackBar = SnackBar(
    content: Text('${product['content_name']} added to cart!'),
    backgroundColor: Colors.amber,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offer Page'),
      ),
      body: _products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}
