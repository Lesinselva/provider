import 'package:flutter/material.dart';
import 'package:pages/navbar/cart/cartdetails.dart';
import 'package:pages/navbar/cart/changenotifier.dart';
import 'package:provider/provider.dart';

class AddToCartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const AddToCartScreen({super.key, required this.products});

  @override
  // ignore: library_private_types_in_public_api
  _AddToCartScreenState createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {print('object');
  
      final cartProvider = Provider.of<CartProvider>(context, listen: false);
    print(cartProvider.cartItems.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        
        itemBuilder: (context, index) {
          print('building');
          print(cartProvider.cartItems.length);
          
          final product = widget.products[index];
          return ListTile(
            title: Text('$index'),
            //title: Text(product['content_name'] ?? 'Product'),
            //subtitle: Text(product['content_price'][0]['saleprice'] ?? ''),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
             //   image: DecorationImage(
               //   image: NetworkImage(product['content_image'][0]['thumbnail_image'] ?? ''),
                 // fit: BoxFit.cover,
                ),
              ),
            
          );
        },
      ),
    );
  }
}