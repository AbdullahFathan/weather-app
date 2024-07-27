import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: const Icon(Icons.search),
            border: Theme.of(context).inputDecorationTheme.border,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Search query is required';
            } else if (value.trim().split(' ').length < 3) {
              return 'Please enter at least 3 words';
            }
            return null;
          },
        ),
      ),
    );
  }
}
