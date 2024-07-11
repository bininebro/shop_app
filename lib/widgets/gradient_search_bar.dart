import 'package:flutter/material.dart';

class GradientSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  GradientSearchBar({required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 1.0,
          color: Colors.transparent,
        ),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(116, 251, 222, 1),
            Color.fromRGBO(60, 65, 191, 1)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(1.2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // Slightly smaller radius
          color: Colors.white,
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            hintText: hintText,
            border: InputBorder.none,
            suffixIcon: const Icon(Icons.search,
                color: Color.fromRGBO(60, 65, 191, 1), size: 30),
          ),
        ),
      ),
    );
  }
}
