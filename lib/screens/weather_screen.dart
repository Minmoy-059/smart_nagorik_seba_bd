import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.addHistory(
      "Weather",
      "Public Services",
      "weather",
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
          "Weather Updates",
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
            Icons.wb_sunny,
            Colors.orange,
            "Current Weather",
            "Today's weather",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.thermostat,
            Colors.red,
            "Temperature",
            "Current temperature",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.water_drop,
            Colors.blue,
            "Rain Forecast",
            "Rain prediction",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.air,
            Colors.green,
            "Wind Speed",
            "Current wind information",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.opacity,
            Colors.cyan,
            "Humidity",
            "Humidity level",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.cloud,
            Colors.grey,
            "Air Quality",
            "AQI Information",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.warning,
            Colors.redAccent,
            "Weather Alert",
            "Government warning",
          ),

          const SizedBox(height:10),

          buildCard(
            Icons.storm,
            Colors.deepPurple,
            "Cyclone Warning",
            "Cyclone updates",
          ),

        ],
      ),
    );
  }
}