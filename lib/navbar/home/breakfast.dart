import 'package:flutter/material.dart';
import 'package:pages/Screen/breakfastscreen.dart';
import 'package:pages/navbar/home/detail.dart';

class Breakfast extends StatelessWidget {
  const Breakfast({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleWidget(
        title: 'Breakfast',
         onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BreakfastScreen()),
          );
        },
      ),
    );
  }
}