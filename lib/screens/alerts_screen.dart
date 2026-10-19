import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "Government Alerts",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Text(
            "Latest Alerts",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Card(
            color: Colors.red.shade50,
            child: const ListTile(
              leading: Icon(
                Icons.warning,
                color: Colors.red,
                size: 35,
              ),
              title: Text(
                "Earthquake Warning",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "No active earthquake warning.\nOfficial alerts will appear here.",
              ),
            ),
          ),
          const SizedBox(height: 15),
          Card(
            color: Colors.blue.shade50,
            child: const ListTile(
              leading: Icon(
                Icons.flood,
                color: Colors.blue,
                size: 35,
              ),
              title: Text(
                "Flood Alert",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "No flood warning issued.",
              ),
            ),
          ),
          const SizedBox(height: 15),
          Card(
            color: Colors.orange.shade50,
            child: const ListTile(
              leading: Icon(
                Icons.air,
                color: Colors.orange,
                size: 35,
              ),
              title: Text(
                "Cyclone Alert",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "No cyclone warning available.",
              ),
            ),
          ),
          const SizedBox(height: 15),
          Card(
            color: Colors.amber.shade50,
            child: const ListTile(
              leading: Icon(
                Icons.thunderstorm,
                color: Colors.amber,
                size: 35,
              ),
              title: Text(
                "Heavy Rain Alert",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "No heavy rainfall warning.",
              ),
            ),
          ),
          const SizedBox(height: 15),
          Card(
            color: Colors.green.shade50,
            child: const ListTile(
              leading: Icon(
                Icons.notifications_active,
                color: Colors.green,
                size: 35,
              ),
              title: Text(
                "Government Notice",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Latest government notices will appear here.",
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Center(
            child: Text(
              "Powered by Official Government Sources",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}