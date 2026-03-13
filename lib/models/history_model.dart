class HistoryItem {
  final String date;
  final String moodEmoji;
  final String topic;

  HistoryItem({
    required this.date,
    required this.moodEmoji,
    required this.topic,
  });
}

// Pre-populated history matching the requirements
List<HistoryItem> historyData = [
  HistoryItem(date: 'March 12', moodEmoji: '😊', topic: 'Mobile App Design'),
  HistoryItem(date: 'March 10', moodEmoji: '🙂', topic: 'Basic Programming'),
  HistoryItem(date: 'March 8', moodEmoji: '😡', topic: 'Database Basics'),
];

// Temporary storage for the check-in flow
String pendingTopic = '';
String pendingMoodEmoji = '😐';
