// ignore: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class MyLogsPage extends StatelessWidget {
  final List<Map<String, String>> logs = [
    {
      'title': 'Log Entry 1',
      'details': 'Details about log entry 1',
      'timestamp': DateFormat('yyyy-MM-dd – kk:mm')
          .format(DateTime.now().subtract(const Duration(hours: 2))),
    },
    {
      'title': 'Log Entry 2',
      'details': 'Details about log entry 2',
      'timestamp': DateFormat('yyyy-MM-dd – kk:mm')
          .format(DateTime.now().subtract(const Duration(hours: 1))),
    },
    {
      'title': 'Log Entry 3',
      'details': 'Details about log entry 3',
      'timestamp': DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Logs'),
        backgroundColor: const Color(0xFFFFB74D), // Soft orange
      ),
      body: ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          final log = logs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFFFB74D), // Soft orange
                child: Icon(Icons.note, color: Color(0xFF1E1E1E)), // Dark gray
              ),
              title: Text(
                log['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E), // Dark gray
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    log['details']!,
                    style:
                        const TextStyle(color: Color(0xFF1E1E1E)), // Dark gray
                  ),
                  const SizedBox(height: 5),
                  Text(
                    log['timestamp']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFBDBDBD), // Light gray
                    ),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward,
                  color: Color(0xFFFFB74D)), // Soft orange
              onTap: () {
                // Handle tap event
              },
            ),
          );
        },
      ),
    );
  }
}
