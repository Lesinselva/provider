import 'package:flutter/material.dart';

class SimpleWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const SimpleWidget(
      {super.key,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
     child: GestureDetector( // Wrap with GestureDetector
        onTap: onTap,
         child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: const Color(0xFF0085FE),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19161F4C),
              blurRadius: 14.70,
              offset: Offset(0, 3.92),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 3,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF2F3B47),
                fontSize: 17.64,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.06,
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
