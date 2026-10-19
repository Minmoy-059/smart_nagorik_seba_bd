import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class TrainScreen extends StatefulWidget {
  const TrainScreen({super.key});

  @override
  State<TrainScreen> createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Train Services",
      "Public Transport",
      "train",
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
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$title feature coming soon")),
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
          "Train Services",
          style: TextStyle(color: AppColors.white),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          buildCard(
            Icons.confirmation_number,
            Colors.green,
            "Buy Train Ticket",
            "Book railway tickets online",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.schedule,
            Colors.blue,
            "Train Schedule",
            "Check train timetable",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.route,
            Colors.orange,
            "Train Routes",
            "View all railway routes",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.location_searching,
            Colors.teal,
            "Live Train Tracking",
            "Track train location",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.attach_money,
            Colors.red,
            "Train Fare",
            "View fare information",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.train,
            Colors.purple,
            "Station Information",
            "Nearby railway stations",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.phone,
            Colors.indigo,
            "Railway Helpline",
            "Customer support",
          ),

        ],
      ),
    );
  }
}