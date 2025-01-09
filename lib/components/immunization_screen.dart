import 'package:flutter/material.dart';
import 'package:sishu_sewa/components/vaccine_timeline.dart';
import 'package:sishu_sewa/immunization_program.dart';
import 'package:sishu_sewa/vaccine.dart';
import 'package:url_launcher/url_launcher.dart';

class ImmunizationScreen extends StatefulWidget {
  final List<ImmunizationProgram> immunizationPrograms;

  const ImmunizationScreen({
    super.key,
    required this.immunizationPrograms,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ImmunizationScreenState createState() => _ImmunizationScreenState();
}

class _ImmunizationScreenState extends State<ImmunizationScreen> {
  int selectedProgramIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the selected program and timeline
  }

  @override
  Widget build(BuildContext context) {
    ImmunizationProgram selectedProgram =
        widget.immunizationPrograms[selectedProgramIndex];
    List<VaccineTimelineData> selectedTimeline = selectedProgram.schedule;

    // Function to open a link in the browser
    // ignore: no_leading_underscores_for_local_identifiers
    void _openLink(String url) async {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown for selecting immunization program
        DropdownButtonFormField<int>(
          value: selectedProgramIndex,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF3E3E3E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          dropdownColor: const Color(0xFF3E3E3E),
          items: widget.immunizationPrograms.asMap().entries.map((entry) {
            return DropdownMenuItem<int>(
              value: entry.key,
              child: Text(
                entry.value.name,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedProgramIndex = value!;
            });
          },
        ),
        const SizedBox(height: 12),

        // Vaccine timeline for the selected program
        VaccineTimeline(timelineData: selectedTimeline),

        const SizedBox(height: 16),

        // Dynamic reference based on selected program
        Center(
          child: GestureDetector(
            onTap: () => _openLink(selectedProgram.link),
            child: Text(
              'According to ${selectedProgram.reference}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blueAccent, // Blue to indicate clickable text
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration
                    .underline, // Underline to highlight it as a link
              ),
            ),
          ),
        ),
      ],
    );
  }
}
