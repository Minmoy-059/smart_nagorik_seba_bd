import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class BirthScreen extends StatefulWidget {
  const BirthScreen({super.key});

  @override
  State<BirthScreen> createState() => _BirthScreenState();
}

class _BirthScreenState extends State<BirthScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Birth Certificate",
      "Government Services",
      "birth",
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
          "Birth Certificate",
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
            "Apply Birth Certificate",
            "New online application",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.verified,
            Colors.blue,
            "Verify Certificate",
            "Verify birth certificate",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.download,
            Colors.orange,
            "Download Certificate",
            "Download digital copy",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.edit_document,
            Colors.red,
            "Correction",
            "Correct certificate information",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.print,
            Colors.purple,
            "Print Certificate",
            "Print your certificate",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.search,
            Colors.teal,
            "Application Status",
            "Track application",
          ),

        ],
      ),
    );
  }
}