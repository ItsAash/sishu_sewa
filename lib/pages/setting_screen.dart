import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _remindersEnabled = true;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          _buildSwitchTile(
            'Enable Notifications',
            _notificationsEnabled,
            (value) => setState(() => _notificationsEnabled = value),
          ),
          _buildSwitchTile(
            'Enable Reminders',
            _remindersEnabled,
            (value) => setState(() => _remindersEnabled = value),
          ),
          _buildLanguageDropdown(),
          ListTile(
            title: const Text('Manage Reminders'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to Manage Reminders screen
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to Privacy Policy screen
            },
          ),
          ListTile(
            title: const Text('Terms of Service'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to Terms of Service screen
            },
          ),
          ListTile(
            title: const Text('About'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to About screen
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement logout functionality
              },
              child: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
    );
  }

  Widget _buildLanguageDropdown() {
    return ListTile(
      title: const Text('Language'),
      trailing: DropdownButton<String>(
        value: _selectedLanguage,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedLanguage = newValue;
            });
          }
        },
        items: <String>['English', 'Spanish', 'French', 'German']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

