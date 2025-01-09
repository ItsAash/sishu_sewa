import 'package:flutter/material.dart';
import 'package:sishu_sewa/vaccine.dart';

class VaccineTimeline extends StatelessWidget {
  final List<VaccineTimelineData> timelineData;

  const VaccineTimeline({super.key, required this.timelineData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: timelineData.map((entry) {
        return _buildTimelineEntry(entry);
      }).toList(),
    );
  }

  Widget _buildTimelineEntry(VaccineTimelineData entry) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          entry.week,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: entry.vaccines.map((vaccine) {
            return _buildVaccineCard(vaccine);
          }).toList(),
        ),
        const Divider(color: Colors.white, thickness: 0.5),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildVaccineCard(Vaccine vaccine) {
    return Card(
      color: const Color(0xFF454545),
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          vaccine.type == 'injection' ? Icons.vaccines : Icons.water_drop,
          color: vaccine.type == 'injection'
              ? Colors.orangeAccent
              : Colors.blueAccent,
        ),
        title: Text(
          vaccine.fullName,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          vaccine.description,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Text(
          vaccine.shortName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
