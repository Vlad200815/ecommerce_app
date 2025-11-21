import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onChanged});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "I am seeking for...",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
