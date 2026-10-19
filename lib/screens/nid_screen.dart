import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class NidScreen extends StatefulWidget {
  const NidScreen({super.key});

  @override
  State<NidScreen> createState() => _NidScreenState();
}

class _NidScreenState extends State<NidScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "NID Services",
      "Government Services",
      "nid",
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
          child: Icon(icon,color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: (){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$title coming soon")),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: const Text(
          "NID Services",
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
            Icons.badge,
            Colors.green,
            "Download NID",
            "Download online copy",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.verified_user,
            Colors.blue,
            "Verify NID",
            "Verify National ID",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.credit_card,
            Colors.orange,
            "Smart Card Status",
            "Check smart card",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.edit_document,
            Colors.red,
            "Correction",
            "Correct NID information",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.location_city,
            Colors.purple,
            "Change Address",
            "Update address",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.person_search,
            Colors.teal,
            "Profile Information",
            "View voter profile",
          ),

        ],
      ),
    );
  }
}