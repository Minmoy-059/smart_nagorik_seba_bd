import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Launch Services",
      "Public Transport",
      "launch",
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
            SnackBar(content: Text("$title feature coming soon")),
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
          "Launch Services",
          style: TextStyle(color: AppColors.white),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          buildCard(
            Icons.confirmation_number,
            Colors.green,
            "Book Launch Ticket",
            "Reserve launch tickets online",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.schedule,
            Colors.blue,
            "Launch Schedule",
            "Today's launch timetable",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.route,
            Colors.orange,
            "Launch Routes",
            "Dhaka • Barisal • Bhola • Chandpur",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.hotel,
            Colors.red,
            "Cabin Booking",
            "VIP & AC Cabin Reservation",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.attach_money,
            Colors.teal,
            "Launch Fare",
            "View ticket price",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.location_searching,
            Colors.purple,
            "Live Launch Tracking",
            "Track launch location",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.phone,
            Colors.indigo,
            "Water Transport Helpline",
            "Emergency Support",
          ),

        ],
      ),
    );
  }
}