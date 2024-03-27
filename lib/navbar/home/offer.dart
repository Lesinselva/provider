import 'package:flutter/material.dart';
import 'package:pages/Screen/offerscreen.dart';
import 'package:pages/navbar/home/detail.dart';


class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleWidget(
        title: 'Offers',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OfferScreen()),
          );
        },
      ),
    );
  }
}
