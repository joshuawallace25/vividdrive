import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final Widget? suffixIcon; // Optional suffix icon

  // Constructor to accept properties like hintText, icon, isPassword, and suffixIcon
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.isPassword = false, // Default isPassword is false
    this.suffixIcon, // Optional suffixIcon parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon, // Use suffixIcon if provided
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
