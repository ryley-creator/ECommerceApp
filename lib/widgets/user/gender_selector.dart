import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  final void Function(String)? onChanged;
  final String? initialValue;

  const GenderSelector({super.key, this.onChanged, this.initialValue});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialValue ?? 'Male';
  }

  void _select(String value) {
    setState(() => selected = value);
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final options = ['Male', 'Female', 'Other'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: options.map((opt) {
            final isSelected = opt == selected;
            return ChoiceChip(
              label: Text(opt),
              selected: isSelected,
              onSelected: (_) => _select(opt),
              selectedColor: Colors.red,
              backgroundColor: Colors.grey.shade200,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            );
          }).toList(),
        ),
      ],
    );
  }
}
