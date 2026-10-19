import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class DrivingLicenseScreen extends StatefulWidget {
  const DrivingLicenseScreen({super.key});

  @override
  State<DrivingLicenseScreen> createState() =>
      _DrivingLicenseScreenState();
}

class _DrivingLicenseScreenState
    extends State<DrivingLicenseScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Driving License",
      "Government Services",
      "driving",
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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
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
          "Driving License",
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
            Icons.app_registration,
            Colors.green,
            "Apply Driving License",
            "Apply online",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.menu_book,
            Colors.blue,
            "Learner License",
            "Apply learner license",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.calendar_today,
            Colors.orange,
            "Driving Test Booking",
            "Book driving test",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.credit_card,
            Colors.red,
            "Smart Card Status",
            "Track smart card",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.refresh,
            Colors.purple,
            "License Renewal",
            "Renew driving license",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.payments,
            Colors.teal,
            "Fee Payment",
            "Pay BRTA fees",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.location_city,
            Colors.indigo,
            "Nearby BRTA Office",
            "Find BRTA office",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.phone,
            Colors.brown,
            "BRTA Helpline",
            "Customer support",
          ),
        ],
      ),
    );
  }
}