import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final DateTime dob;
  final String imgUrl;
  EditProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dob,
    required this.imgUrl,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late String _imgUrl;
  late String _selectedGender; // Default gender
  late DateTime _selectedDate; // Default date

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    _imgUrl = widget.imgUrl;
    _selectedDate = widget.dob;
    _selectedGender = widget.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal Information",
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Rubik"),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3E3E3E),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF3E3E3E),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage(_imgUrl), // Replace with actual image
            ),
            const SizedBox(height: 10),
            // Name and Email Display
            Text(
              _nameController.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              _emailController.text,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 30),
            // Editable Fields
            _buildTextField(controller: _nameController, label: "Full Name"),
            const SizedBox(height: 20),
            _buildTextField(
                controller: _emailController, label: "puspati_sari@gmail.com"),
            const SizedBox(height: 20),
            _buildPhoneField(),
            const SizedBox(height: 20),
            _buildGenderDropdown(),
            const SizedBox(height: 20),
            _buildDateField(),
            const SizedBox(height: 30),
            // Update Button
            ElevatedButton(
              onPressed: _updateProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
              ),
              child: const Text(
                "Update Profile",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildTextField(
      {required TextEditingController controller, required String label}) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF5D5C5D),
        hintText: label,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 10, right: 8),
          child: Icon(Icons.flag,
              color: Colors.white), // Placeholder for country flag
        ),
        filled: true,
        fillColor: const Color(0xFF5D5C5D),
        hintText: "+1-123-456-7890",
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF5D5C5D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: _selectedGender,
        isExpanded: true,
        dropdownColor: const Color(0xFF5D5C5D),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        underline: const SizedBox(),
        style: const TextStyle(color: Colors.white, fontSize: 16),
        items: ['Female', 'Male', 'Other']
            .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                ))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedGender = value;
            });
          }
        },
      ),
    );
  }

  Widget _buildDateField() {
    return TextField(
      readOnly: true,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF5D5C5D),
        hintText: _selectedDate.toLocal().toString().split(' ')[0],
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today, color: Colors.white),
          onPressed: _pickDate,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Color(0xFF5D5C5D),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _updateProfile() {
    // Logic to update the profile (e.g., send data to the backend)
    print("Profile updated with:");
    print("Name: ${_nameController.text}");
    print("Email: ${_emailController.text}");
    print("Phone: ${_phoneController.text}");
    print("Gender: $_selectedGender");
    print("Date of Birth: $_selectedDate");
  }
}
