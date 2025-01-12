import 'package:flutter/material.dart';
import 'package:sishu_sewa/pages/profile/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Settings state
  bool isNotificationEnabled = false;
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = "English";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E3E3E), // Dark background color
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Card
              _buildProfileCard(),
              const SizedBox(height: 20),
              // Options List
              _buildOptionsSection(),
              const SizedBox(height: 20),
              const Text(
                "More",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildMoreSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditProfileScreen(
              name: "Prabesh Guragain",
              email: "prabeshguragain@gmail.com",
              dob: DateTime(1998, 10, 1),
              gender: "Male",
              phone: "9841234567",
              imgUrl: "https://randomuser.me/api/portraits/men/1.jpg",
            ),
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF5D5C5D),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: const Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Replace with actual image
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Prabesh Guragain',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'prabeshguragain@gmail.com',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.edit, color: Colors.white),
            ],
          ),
        ));
  }

  Widget _buildOptionsSection() {
    return _buildSectionContainer(
      children: [
        _buildCustomTile(
          icon: Icons.person,
          title: 'My Account',
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onTap: () {
            print('My Account clicked');
          },
        ),
        _buildCustomTile(
          icon: Icons.notifications,
          title: 'Enable Notification',
          trailing: Switch(
            value: isNotificationEnabled,
            onChanged: (value) {
              setState(() {
                isNotificationEnabled = value;
              });
            },
            activeColor: Colors.blue,
          ),
        ),
        _buildCustomTile(
          icon: Icons.alarm,
          title: 'Manage Remainder',
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onTap: () {
            print('Manage Remainder clicked');
          },
        ),
        _buildCustomTile(
          icon: Icons.language,
          title: 'Language',
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onTap: () {
            _showLanguageSelectionDialog(context);
          },
        ),
        _buildCustomTile(
          icon: Icons.logout,
          title: 'Log out',
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onTap: () {
            _showLogoutConfirmationDialog(context);
          },
        ),
      ],
    );
  }

  Widget _buildMoreSection() {
    return _buildSectionContainer(
      children: [
        _buildCustomTile(
          icon: Icons.help,
          title: 'Terms of Service',
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onTap: () {
            print('Terms of Service clicked');
          },
        ),
        _buildCustomTile(
          icon: Icons.privacy_tip,
          title: 'Privacy Policy',
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onTap: () {
            print('Privacy Policy clicked');
          },
        ),
        _buildCustomTile(
          icon: Icons.support,
          title: 'Help & Support',
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onTap: () {
            print('Help & Support clicked');
          },
        ),
        _buildCustomTile(
          icon: Icons.info,
          title: 'About App',
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onTap: () {
            print('About App clicked');
          },
        ),
      ],
    );
  }

  Widget _buildSectionContainer({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF5D5C5D),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildCustomTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor:
            Colors.white.withOpacity(0.2), // Subtle light splash effect
        highlightColor: Colors.grey.withOpacity(0.1), // Slight gray highlight
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 60, // Consistent height for each tile
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Dismiss dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor:
              Colors.transparent, // Transparent to allow custom styling
          child: Container(
            width:
                MediaQuery.of(context).size.width * 0.9, // 90% of screen width
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF5D5C5D), // Match the dark theme
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjust height to content
              children: [
                const Text(
                  'Confirm Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Are you sure you want to log out?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        _performLogout(); // Handle the logout logic
                      },
                      child: const Text(
                        'Log Out',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allow dismiss by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF5D5C5D), // Match the dark theme
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Wrap content
              children: [
                const Text(
                  'Select Language',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Language options
                RadioListTile<String>(
                  value: 'English',
                  groupValue: selectedLanguage,
                  onChanged: (value) {
                    if (value != null) {
                      selectedLanguage = value;
                      Navigator.of(context).pop(); // Close dialog
                      _applyLanguageChange(selectedLanguage); // Apply changes
                    }
                  },
                  title: const Text(
                    'English',
                    style: TextStyle(color: Colors.white),
                  ),
                  activeColor: Colors.blue,
                  tileColor: Colors.transparent,
                ),
                RadioListTile<String>(
                  value: 'Spanish',
                  groupValue: selectedLanguage,
                  onChanged: (value) {
                    if (value != null) {
                      selectedLanguage = value;
                      Navigator.of(context).pop(); // Close dialog
                      _applyLanguageChange(selectedLanguage); // Apply changes
                    }
                  },
                  title: const Text(
                    'Spanish',
                    style: TextStyle(color: Colors.white),
                  ),
                  activeColor: Colors.blue,
                ),
                RadioListTile<String>(
                  value: 'Nepali',
                  groupValue: selectedLanguage,
                  onChanged: (value) {
                    if (value != null) {
                      selectedLanguage = value;
                      Navigator.of(context).pop(); // Close dialog
                      _applyLanguageChange(selectedLanguage); // Apply changes
                    }
                  },
                  title: const Text(
                    'Nepali',
                    style: TextStyle(color: Colors.white),
                  ),
                  activeColor: Colors.blue,
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _applyLanguageChange(String language) {
    // Implement logic to apply the selected language here
    setState(() {
      selectedLanguage = language;
    });
  }

  void _performLogout() {
    // Handle your logout logic here, e.g., clearing user data, navigating to login screen
  }
}
