import 'package:flutter/material.dart';
import '../models/measurement.dart';

class UpdateDataScreen extends StatefulWidget {
  final ChildMeasurement child;
  final Function(Measurement) onUpdate;

  const UpdateDataScreen({
    Key? key,
    required this.child,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _UpdateDataScreenState createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _selectedDate;
  late TextEditingController _heightController;
  late TextEditingController _weightController;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _heightController = TextEditingController();
    _weightController = TextEditingController();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Update measurements for ${widget.child.name}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildDatePicker(),
                const SizedBox(height: 20),
                _buildTextFormField(
                  controller: _heightController,
                  label: 'Height (cm)',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                _buildTextFormField(
                  controller: _weightController,
                  label: 'Weight (kg)',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Save Measurement'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: widget.child.birthDate,
          lastDate: DateTime.now(),
        );
        if (picked != null && picked != _selectedDate) {
          setState(() {
            _selectedDate = picked;
          });
        }
      },
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Date',
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_selectedDate.toLocal()}".split(' ')[0],
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required TextInputType keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        if (double.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final height = double.parse(_heightController.text);
      final weight = double.parse(_weightController.text);
      final bmi = weight / ((height / 100) * (height / 100));

      final newMeasurement = Measurement(
        date: _selectedDate,
        height: height,
        weight: weight,
        bmi: bmi,
        heightStatus: _calculateHeightStatus(height),
        weightStatus: _calculateWeightStatus(weight),
        bmiStatus: _calculateBMIStatus(bmi),
      );

      widget.onUpdate(newMeasurement);
      Navigator.pop(context);
    }
  }

  String _calculateHeightStatus(double height) {
    // This is a simplified logic. In a real app, you'd use more complex calculations based on age and gender.
    if (height < 50) return 'Insufficient';
    if (height > 200) return 'Excessive';
    return 'Good';
  }

  String _calculateWeightStatus(double weight) {
    // This is a simplified logic. In a real app, you'd use more complex calculations based on age and gender.
    if (weight < 3) return 'Insufficient';
    if (weight > 150) return 'Excessive';
    return 'Good';
  }

  String _calculateBMIStatus(double bmi) {
    if (bmi < 18.5) return 'Insufficient';
    if (bmi >= 25) return 'Excessive';
    return 'Good';
  }
}

