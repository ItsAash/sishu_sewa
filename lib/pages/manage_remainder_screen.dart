import 'package:flutter/material.dart';

class ManageRemindersScreen extends StatefulWidget {
  const ManageRemindersScreen({Key? key}) : super(key: key);

  @override
  _ManageRemindersScreenState createState() => _ManageRemindersScreenState();
}

class _ManageRemindersScreenState extends State<ManageRemindersScreen> {
  final List<Map<String, dynamic>> _reminders = [
    {'title': 'Vaccination', 'date': DateTime.now().add(const Duration(days: 7)), 'enabled': true},
    {'title': 'Doctor Appointment', 'date': DateTime.now().add(const Duration(days: 14)), 'enabled': true},
    {'title': 'Growth Measurement', 'date': DateTime.now().add(const Duration(days: 30)), 'enabled': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Reminders'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: _reminders.length,
        itemBuilder: (context, index) {
          final reminder = _reminders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(reminder['title']),
              subtitle: Text(
                '${reminder['date'].day}/${reminder['date'].month}/${reminder['date'].year}',
              ),
              trailing: Switch(
                value: reminder['enabled'],
                onChanged: (bool value) {
                  setState(() {
                    reminder['enabled'] = value;
                  });
                },
                activeColor: Colors.blue,
              ),
              onTap: () {
                _editReminder(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addReminder,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _addReminder() {
    // TODO: Implement add reminder functionality
  }

  void _editReminder(int index) {
    // TODO: Implement edit reminder functionality
  }
}

