import 'package:flutter/material.dart';
import '../models/history_model.dart';
import '../widgets/mood_selector.dart';
import 'history_screen.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  final _studentIdController = TextEditingController();
  final _nameController = TextEditingController();
  final _previousTopicController = TextEditingController();
  final _expectedTopicController = TextEditingController();

  int _selectedMoodIndex = -1;
  String _selectedMoodEmoji = '';

  @override
  void dispose() {
    _studentIdController.dispose();
    _nameController.dispose();
    _previousTopicController.dispose();
    _expectedTopicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Check-in', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD), // Light blue
              Color(0xFFF4F8FB), // Soft background
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField(label: 'Student ID', controller: _studentIdController, icon: Icons.badge_outlined),
                const SizedBox(height: 16),
                _buildTextField(label: 'Name', controller: _nameController, icon: Icons.person_outline),
                const SizedBox(height: 16),
                _buildSectionCard(
                  title: 'Class Information',
                  children: [
                    _buildTextField(label: 'Previous Topic', controller: _previousTopicController, icon: Icons.history_edu),
                    const SizedBox(height: 16),
                    _buildTextField(label: 'Expected Topic', controller: _expectedTopicController, icon: Icons.menu_book),
                  ],
                ),
                const SizedBox(height: 24),
                

                
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 12.0),
                  child: Text(
                    'Mood Before Class',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ),
                
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
                    if (_studentIdController.text.isEmpty || _nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill out all required fields.')),
                      );
                      return;
                    }

                    final newRecord = HistoryItem(
                      date: 'March 13', // Hardcoded date representation as an example
                      moodEmoji: _selectedMoodIndex != -1 ? _selectedMoodEmoji : '😐',
                      topic: _expectedTopicController.text.isNotEmpty ? _expectedTopicController.text : 'Unknown Topic',
                      studentId: _studentIdController.text,
                      name: _nameController.text,
                      previousTopic: _previousTopicController.text,
                    );

                    historyData.insert(0, newRecord);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HistoryScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 4,
                    shadowColor: Colors.blue.withOpacity(0.4),
                  ),
                  child: const Text('Check-in', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required List<Widget> children}) {
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, required TextEditingController controller, required IconData icon}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade600),
        prefixIcon: Icon(icon, color: Colors.blue.shade400),
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        border: OutlineInputBorder(
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
