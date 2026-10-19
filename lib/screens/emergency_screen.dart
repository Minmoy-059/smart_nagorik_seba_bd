import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Emergency Services",
      "Public Services",
      "emergency",
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
          backgroundColor: color.withOpacity(.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.call, color: Colors.green),
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
          "Emergency Services",
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
            Icons.emergency,
            Colors.red,
            "National Emergency",
            "Call 999",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.local_police,
            Colors.blue,
            "Police",
            "Emergency Police Service",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.local_fire_department,
            Colors.deepOrange,
            "Fire Service",
            "Fire & Rescue",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.medical_services,
            Colors.green,
            "Ambulance",
            "Emergency Ambulance",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.bloodtype,
            Colors.redAccent,
            "Blood Emergency",
            "Find Blood Donor",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.woman,
            Colors.purple,
            "Women & Child Helpline",
            "Support Service",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.electrical_services,
            Colors.orange,
            "Electricity Emergency",
            "Power Failure",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.gas_meter,
            Colors.brown,
            "Gas Emergency",
            "Gas Leak Support",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.flood,
            Colors.teal,
            "Disaster Management",
            "Flood & Cyclone Help",
          ),

        ],
      ),
    );
  }
}