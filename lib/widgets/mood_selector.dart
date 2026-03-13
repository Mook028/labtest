import 'package:flutter/material.dart';

class MoodSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int, String) onMoodSelected;

  MoodSelector({
    super.key,
    required this.selectedIndex,
    required this.onMoodSelected,
  });

  final List<Map<String, String>> moodOptions = [
    {'emoji': '😡', 'label': 'Very negative'},
    {'emoji': '😟', 'label': 'Negative'},
    {'emoji': '😐', 'label': 'Neutral'},
    {'emoji': '🙂', 'label': 'Positive'},
    {'emoji': '😄', 'label': 'Very positive'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: List.generate(moodOptions.length, (index) {
          final mood = moodOptions[index];
          final isSelected = selectedIndex == index;
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            leading: Text(mood['emoji']!, style: const TextStyle(fontSize: 28)),
            title: Text(
              mood['label']!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? Theme.of(context).primaryColor : Colors.black87,
              ),
            ),
            trailing: isSelected
                ? Icon(Icons.check_circle_rounded, color: Theme.of(context).primaryColor)
                : null,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            tileColor: isSelected ? Colors.blue.shade50 : null,
            onTap: () => onMoodSelected(index, mood['emoji']!),
          );
        }),
      ),
    );
  }
}
