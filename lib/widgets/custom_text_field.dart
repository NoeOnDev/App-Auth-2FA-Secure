import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 19,
                  horizontal: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
