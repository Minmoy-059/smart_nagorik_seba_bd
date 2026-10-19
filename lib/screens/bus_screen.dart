import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({super.key});

  @override
  State<BusScreen> createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Bus Services",
      "Public Transport",
      "bus",
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
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
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
        title: const Text(
          "Bus Services",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryGreen,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          buildCard(
            Icons.confirmation_number,
            Colors.green,
            "Buy Bus Ticket",
            "Book tickets online",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.route,
            Colors.blue,
            "Bus Routes",
            "View all bus routes",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.schedule,
            Colors.orange,
            "Bus Schedule",
            "Check departure time",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.attach_money,
            Colors.red,
            "Bus Fare",
            "View fare information",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.location_on,
            Colors.purple,
            "Nearby Bus Counter",
            "Find nearest counters",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.location_searching,
            Colors.teal,
            "Live Bus Tracking",
            "Track your bus",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.phone,
            Colors.indigo,
            "Transport Helpline",
            "Emergency support",
          ),

        ],
      ),
    );
  }
}