import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({super.key});

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Hospital Services",
      "Public Services",
      "hospital",
    );
  }

  Widget buildCard(
    IconData icon,
    Color color,
    String title,
    String subtitle,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("$title feature coming soon"),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: const Text(
          "Hospital Services",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          buildCard(
            Icons.local_hospital,
            Colors.red,
            "Nearby Hospitals",
            "Find nearby hospitals",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.person_search,
            Colors.blue,
            "Doctor Appointment",
            "Book doctor appointment",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.emergency,
            Colors.orange,
            "Emergency Ambulance",
            "Call ambulance quickly",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.bloodtype,
            Colors.redAccent,
            "Blood Bank",
            "Find blood donors",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.local_pharmacy,
            Colors.green,
            "Nearby Pharmacy",
            "Medicine shops near you",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.biotech,
            Colors.purple,
            "Diagnostic Center",
            "Lab & diagnostic services",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.monitor_heart,
            Colors.teal,
            "ICU Availability",
            "Check ICU beds",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.phone,
            Colors.indigo,
            "Hospital Helpline",
            "Emergency contact numbers",
          ),

        ],
      ),
    );
  }
}