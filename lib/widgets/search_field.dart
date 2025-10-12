import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: 'Search any product...',
          contentPadding: EdgeInsets.symmetric(vertical: 3),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
