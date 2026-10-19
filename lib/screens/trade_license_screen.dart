import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class TradeLicenseScreen extends StatefulWidget {
  const TradeLicenseScreen({super.key});

  @override
  State<TradeLicenseScreen> createState() =>
      _TradeLicenseScreenState();
}

class _TradeLicenseScreenState
    extends State<TradeLicenseScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Trade License",
      "Government Services",
      "trade",
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
          "Trade License",
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
            "New Trade License",
            "Apply for a new trade license",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.refresh,
            Colors.blue,
            "License Renewal",
            "Renew your trade license",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.search,
            Colors.orange,
            "Application Status",
            "Track your application",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.verified,
            Colors.red,
            "Verify Trade License",
            "Verify license information",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.download,
            Colors.purple,
            "Download License",
            "Download digital copy",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.payments,
            Colors.teal,
            "Fee Payment",
            "Pay trade license fees",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.location_city,
            Colors.indigo,
            "City Corporation Office",
            "Find nearest office",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.phone,
            Colors.brown,
            "Trade License Helpline",
            "Customer support",
          ),
        ],
      ),
    );
  }
}