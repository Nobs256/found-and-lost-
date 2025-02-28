import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../src/app_color.dart';
import '../home_screen.dart';

enum ItemType { Found, Lost }

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  ItemType? _selectedType = ItemType.Found;
  final Map<String, bool> _selectedItems = {
    'Wallet': false,
    'Keys': false,
    'Laptop': false,
    'Phone': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.defaultColor,
        elevation: 1,
        title: const Text(
          'Filters',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader(
                      icon: Icons.location_on_outlined,
                      title: 'Location',
                    ),
                    const SizedBox(height: 12),
                    _buildMapButton(),
                    const SizedBox(height: 24),
                    _buildSectionHeader(
                      icon: Icons.category_outlined,
                      title: 'Type',
                    ),
                    const SizedBox(height: 12),
                    _buildTypeSelector(),
                    const SizedBox(height: 24),
                    _buildSectionHeader(
                      icon: Icons.search_outlined,
                      title: 'Search Items',
                    ),
                    const SizedBox(height: 12),
                    _buildItemGrid(),
                  ],
                ),
              ),
            ),
            _buildBottomActionBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({required IconData icon, required String title}) {
    return Row(
      children: [
        Icon(icon, size: 24, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget _buildMapButton() {
    return OutlinedButton.icon(
      icon: const Icon(Icons.map_outlined, size: 20),
      label: const Text('Select Location on Map'),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColor.defaultColor,
        side: BorderSide(color: AppColor.defaultColor!),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},
    );
  }

  Widget _buildTypeSelector() {
    return CupertinoSlidingSegmentedControl<ItemType>(
      groupValue: _selectedType,
      padding: const EdgeInsets.all(4),
      thumbColor: AppColor.defaultColor,
      // backgroundColor: Colors.grey[200],
      children: {
        ItemType.Found: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Found Items',
            style: TextStyle(
              color: _selectedType == ItemType.Found
                  ? Colors.white
                  : Colors.grey[800],
            ),
          ),
        ),
        ItemType.Lost: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Lost Items',
            style: TextStyle(
              color: _selectedType == ItemType.Lost
                  ? Colors.white
                  : Colors.grey[800],
            ),
          ),
        ),
      },
      onValueChanged: (ItemType? value) {
        setState(() => _selectedType = value);
      },
    );
  }

  Widget _buildItemGrid() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _selectedItems.keys.map((String item) {
        return FilterChip(
          label: Text(item),
          selected: _selectedItems[item]!,
          // ignore: deprecated_member_use
          selectedColor: AppColor.defaultColor.withOpacity(0.2),
          checkmarkColor: AppColor.defaultColor,
          labelStyle: TextStyle(
            color: _selectedItems[item]! ? AppColor.defaultColor : Colors.grey[800],
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onSelected: (bool selected) {
            setState(() => _selectedItems[item] = selected);
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.check_circle_outline, size: 20),
              label: const Text('Apply Filters'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.defaultColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}