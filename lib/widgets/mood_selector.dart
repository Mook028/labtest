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
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: List.generate(moodOptions.length, (index) {
          final mood = moodOptions[index];
          final isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.shade100.withOpacity(0.5) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Text(mood['emoji']!, style: const TextStyle(fontSize: 24)),
              ),
              title: Text(
                mood['label']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? Colors.blue.shade700 : Colors.black87,
                ),
              ),
              trailing: isSelected
                  ? Icon(Icons.check_circle_rounded, color: Colors.blue.shade600)
                  : null,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              tileColor: isSelected ? Colors.blue.shade50.withOpacity(0.3) : Colors.transparent,
              onTap: () => onMoodSelected(index, mood['emoji']!),
            ),
          );
        }),
      ),
    );
  }
}
