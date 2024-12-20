import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeChip extends StatefulWidget {
  List<String> categorys;
  final String selecteduser;
  final Function(String) onselectedcategorys;

  HomeChip({
    super.key,
    required this.selecteduser,
    required this.categorys,
    required this.onselectedcategorys,
  });

  @override
  _HomeChipState createState() => _HomeChipState();
}

class _HomeChipState extends State<HomeChip> {
  // This will hold the filtered categories based on the search query
  List<String> filteredCategories = [];

  // Controller for the search bar
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initially, all categories are visible
    filteredCategories = widget.categorys;
  }

  // Function to filter categories based on the search query
  void _filterCategories(String query) {
    setState(() {
      // Filter categories that contain the search query
      filteredCategories = widget.categorys
          .where((category) =>
              category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //     controller: _searchController,
        //     onChanged: (query) {
        //       // Filter categories as user types
        //       _filterCategories(query);
        //     },
        //     decoration: InputDecoration(
        //       labelText: 'Search Categories',
        //       border: OutlineInputBorder(),
        //     ),
        //   ),
        // ),

        // Show message if no items match the search query
        if (filteredCategories.isEmpty && _searchController.text.isNotEmpty)
          Center(
            child: Text(
              'No items available for "${_searchController.text}"',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),

        // Wrap the filtered categories into choice chips
        Wrap(
          spacing: 10,
          children: filteredCategories.map((category) {
            return ChoiceChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Color(0xFF75B809)),
              ),
              backgroundColor: Colors.white,
              selectedColor: Color(0xFF75B809),
              labelStyle: TextStyle(
                fontWeight: widget.selecteduser == category
                    ? FontWeight.bold
                    : FontWeight.bold,
                color: widget.selecteduser == category
                    ? Colors.white
                    : Colors.black,
              ),
              showCheckmark: false,
              label: Text(category),
              selected: widget.selecteduser == category,
              onSelected: (bool isselected) {
                widget.onselectedcategorys(isselected ? category : "");
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
