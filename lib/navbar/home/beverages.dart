import 'package:flutter/material.dart';
import 'package:pages/Screen/beveragescreen.dart';
import 'package:pages/navbar/home/detail.dart';

class Beverages extends StatelessWidget {
  const Beverages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleWidget(
        title: 'Beverages',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BeverageScreen()),
          );
        },
      ),
    );
  }
}