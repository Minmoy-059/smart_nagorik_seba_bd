import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class PassportScreen extends StatefulWidget {
  const PassportScreen({super.key});

  @override
  State<PassportScreen> createState() => _PassportScreenState();
}

class _PassportScreenState extends State<PassportScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Passport Services",
      "Government Services",
      "passport",
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
          "Passport Services",
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
            "Apply e-Passport",
            "Submit new passport application",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.search,
            Colors.blue,
            "Passport Status",
            "Track application status",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.calendar_month,
            Colors.orange,
            "Appointment Booking",
            "Schedule passport appointment",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.payments,
            Colors.red,
            "Passport Fee",
            "Check passport fees",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.location_on,
            Colors.purple,
            "Passport Office",
            "Find nearby passport office",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.download,
            Colors.teal,
            "Download Application",
            "Download application form",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.support_agent,
            Colors.indigo,
            "Passport Helpline",
            "Customer support & emergency",
          ),

        ],
      ),
    );
  }
}