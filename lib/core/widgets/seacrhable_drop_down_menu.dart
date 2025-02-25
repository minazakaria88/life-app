

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';


class SearchableDropdownMenu extends StatefulWidget {
  final double menuHeight;
  final double maxHeight;
  final double? width;
  final String? initialValue;
  final String label;
  final List<DropdownMenuEntry> dropdownMenuEntries;
  final Function(String?) onSelected;

  const SearchableDropdownMenu({
    super.key,
    required this.menuHeight,
    required this.maxHeight,
    this.width,
    this.initialValue,
    required this.label,
    required this.dropdownMenuEntries,
    required this.onSelected,
  });

  @override
  State<SearchableDropdownMenu> createState() => _SearchableDropdownMenuState();
}

class _SearchableDropdownMenuState extends State<SearchableDropdownMenu> {
  final TextEditingController _searchController = TextEditingController();
  List<DropdownMenuEntry> _filteredEntries = [];

  @override
  void initState() {
    super.initState();
    _filteredEntries = widget.dropdownMenuEntries;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredEntries = widget.dropdownMenuEntries
          .where((entry) => entry.label.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return DropdownMenu(
          menuHeight: widget.menuHeight,
          inputDecorationTheme: InputDecorationTheme(
            iconColor: Colors.green,
            constraints: BoxConstraints(maxHeight: widget.maxHeight),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          width: widget.width ?? MediaQuery.sizeOf(context).width * 0.6,
          initialSelection: widget.initialValue,
          errorText: const InputDecoration().errorText,
          label: Text(widget.label),
          onSelected: (value) {
            widget.onSelected(value);
          },
          dropdownMenuEntries: _filteredEntries,
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return _filteredEntries.map((entry) {
          return ListTile(
            title: Text(entry.label),
            onTap: () {
              setState(() {
                _searchController.text = entry.label;
                widget.onSelected(entry.value);
              });
              controller.closeView(entry.label);
            },
          );
        }).toList();
      },
    );
  }
}