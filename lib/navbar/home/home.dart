import 'package:flutter/material.dart';
import 'package:pages/navbar/home/offer.dart';
import 'package:pages/navbar/home/accompaniment.dart';
import 'package:pages/navbar/home/beverages.dart';
import 'package:pages/navbar/home/breakfast.dart';
import 'package:pages/navbar/home/dessert.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
 Widget build(BuildContext context) {
  return ListView(
    children: const [
      Offer(),
      Accompaniments(),
      Breakfast(),
      Desserts(),
      Beverages(),
      
    ],
  );
}
}