import 'package:flutter/material.dart';
import 'package:pages/Screen/accompanimentsscreen.dart';
import 'package:pages/navbar/home/detail.dart';

class Accompaniments extends StatelessWidget {
  const Accompaniments({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleWidget(
        title: 'Accompaniments',
       onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccompanimentsScreen()),
          );
        },
      ),
    );
  }
}
