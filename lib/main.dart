import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:pages/navbar/home/home.dart';
import 'package:pages/navbar/cart/cart.dart';
import 'package:pages/navbar/cart/changenotifier.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodCafe(),
      ),
    ),
  );
}

class FoodCafe extends StatefulWidget {
  const FoodCafe({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FoodCafeState createState() => _FoodCafeState();
}

class _FoodCafeState extends State<FoodCafe> {
  int _selectedIndex = 0;

  static const List<Widget> _allPages = <Widget>[
      Home(),
      AddToCartScreen(products: [],)
  ];
  static const List<String> _appBarTitles = ['Home',
  'Cart',
  'Membership',
  'Settings',
  'More'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text( _appBarTitles[_selectedIndex],
          style: const TextStyle(color: Color.fromARGB(255, 255, 174, 0),
          fontSize: 30), 
        ),
      ),
       body: IndexedStack(
        index: _selectedIndex,
        children: _allPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem( 
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem( 
            backgroundColor: Colors.black,
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
             backgroundColor: Colors.black,
            icon: Icon(Icons.card_membership),
            label: 'Membership',
          ),
          BottomNavigationBarItem(
             backgroundColor: Colors.black,
            icon: Icon(Icons.settings),
            label: 'Settings',
          ), BottomNavigationBarItem( 
            backgroundColor: Colors.black,
            icon: Icon(Icons.more),
            label: 'more',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 174, 0),
        onTap: _onItemTapped,
      ),
    );
  }
}
Future<Map<String, dynamic>> fetchData() async {
  String url = 'https://develop.heartinz.in/api/get-store-digital-menu';
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  Map<String, dynamic> data = {
    "storeid": "61cf00f1747cb740a3bf00b6",
    "zoneid": ""
  };

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw 'Failed to load data';
    }
  } catch (e) {
    throw 'Error: $e';
  }
}
