import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final void Function(String)? onChanged;

  const MyTextField({
    super.key,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter location',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        onChanged: onChanged,
      ),
    );
  }
}