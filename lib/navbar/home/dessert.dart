import 'package:flutter/material.dart';
import 'package:pages/Screen/dessertsscreen.dart';
import 'package:pages/navbar/home/detail.dart';

class Desserts extends StatelessWidget {
  const Desserts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleWidget(
        title: 'Desserts',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DessertsScreen()),
          );
        },
      ),
    );
  }
}