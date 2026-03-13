import 'package:flutter/material.dart';
import '../models/history_model.dart';
import '../widgets/mood_selector.dart';
import 'qr_scan_screen.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  final _previousTopicController = TextEditingController();
  final _expectedTopicController = TextEditingController();

  int _selectedMoodIndex = -1;
  String _selectedMoodEmoji = '';

  @override
  void dispose() {
    _previousTopicController.dispose();
    _expectedTopicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check-in')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(label: 'Previous Topic', controller: _previousTopicController),
            const SizedBox(height: 16),
            _buildTextField(label: 'Expected Topic', controller: _expectedTopicController),
            const SizedBox(height: 32),

            const Text(
              'Mood Before Class',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 16),

            MoodSelector(
              selectedIndex: _selectedMoodIndex,
              onMoodSelected: (index, emoji) {
                setState(() {
                  _selectedMoodIndex = index;
                  _selectedMoodEmoji = emoji;
                });
              },
            ),
            
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                pendingTopic = _expectedTopicController.text.isNotEmpty
                    ? _expectedTopicController.text
                    : 'Unknown Topic';
                pendingMoodEmoji = _selectedMoodIndex != -1
                    ? _selectedMoodEmoji
                    : '😐';

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QRScanScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: const Text('Next', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade600),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blue.shade300, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}
