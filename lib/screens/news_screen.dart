import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "News & Alerts",
      "Public Services",
      "news",
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
          "News & Alerts",
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
            Icons.newspaper,
            Colors.blue,
            "Government News",
            "Latest government news",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.warning,
            Colors.red,
            "Emergency Alerts",
            "Emergency notifications",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.cloud,
            Colors.orange,
            "Weather Alerts",
            "Weather warnings",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.traffic,
            Colors.green,
            "Traffic Updates",
            "Road & traffic updates",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.train,
            Colors.purple,
            "Railway Notices",
            "Bangladesh Railway updates",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.directions_boat,
            Colors.teal,
            "Launch Notices",
            "Water transport updates",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.directions_bus,
            Colors.indigo,
            "Bus Service Updates",
            "Bus schedule changes",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.campaign,
            Colors.deepOrange,
            "Public Announcements",
            "Government announcements",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.notifications_active,
            Colors.redAccent,
            "Push Notifications",
            "Latest notifications",
          ),

        ],
      ),
    );
  }
}