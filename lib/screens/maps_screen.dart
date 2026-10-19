import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Maps",
      "Public Services",
      "maps",
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
          "Maps & Navigation",
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
            Icons.my_location,
            Colors.blue,
            "Current Location",
            "Find your current location",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.map,
            Colors.green,
            "Open Maps",
            "Explore map",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.local_hospital,
            Colors.red,
            "Nearby Hospitals",
            "Find nearest hospitals",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.local_police,
            Colors.indigo,
            "Police Station",
            "Nearest police station",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.local_fire_department,
            Colors.deepOrange,
            "Fire Service",
            "Nearest fire station",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.local_gas_station,
            Colors.orange,
            "Petrol Pump",
            "Nearby fuel station",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.account_balance,
            Colors.purple,
            "ATM & Bank",
            "Nearby ATM and banks",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.account_balance_outlined,
            Colors.teal,
            "Government Office",
            "Nearby government offices",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.directions_bus,
            Colors.green,
            "Bus Stand",
            "Nearest bus terminal",
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.train,
            Colors.blueGrey,
            "Railway Station",
            "Nearest railway station",
          ),
        ],
      ),
    );
  }
}