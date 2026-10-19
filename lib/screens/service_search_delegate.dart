import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

import 'bus_screen.dart';
import 'train_screen.dart';
import 'launch_screen.dart';
import 'hospital_screen.dart';
import 'emergency_screen.dart';
import 'maps_screen.dart';
import 'weather_screen.dart';
import 'nid_screen.dart';
import 'birth_screen.dart';
import 'passport_screen.dart';
import 'driving_license_screen.dart';
import 'trade_license_screen.dart';

class ServiceModel {
  final String title;
  final String category;
  final String route;
  final IconData icon;
  final Widget screen;

  ServiceModel({
    required this.title,
    required this.category,
    required this.route,
    required this.icon,
    required this.screen,
  });
}

class ServiceSearchDelegate extends SearchDelegate {
  final List<ServiceModel> services = [
    ServiceModel(
      title: "Bus Services",
      category: "Public Transport",
      route: "bus",
      icon: Icons.directions_bus,
      screen: const BusScreen(),
    ),
    ServiceModel(
      title: "Train Services",
      category: "Public Transport",
      route: "train",
      icon: Icons.directions_train,
      screen: const TrainScreen(),
    ),
    ServiceModel(
      title: "Launch Services",
      category: "Public Transport",
      route: "launch",
      icon: Icons.directions_boat,
      screen: const LaunchScreen(),
    ),
    ServiceModel(
      title: "Hospital Services",
      category: "Public Services",
      route: "hospital",
      icon: Icons.local_hospital,
      screen: const HospitalScreen(),
    ),
    ServiceModel(
      title: "Emergency Services",
      category: "Public Services",
      route: "emergency",
      icon: Icons.emergency,
      screen: const EmergencyScreen(),
    ),
    ServiceModel(
      title: "Maps Service",
      category: "Public Services",
      route: "maps",
      icon: Icons.map,
      screen: const MapsScreen(),
    ),
    ServiceModel(
      title: "Weather Updates",
      category: "Public Services",
      route: "weather",
      icon: Icons.cloud,
      screen: const WeatherScreen(),
    ),
    ServiceModel(
      title: "NID Services",
      category: "Government Services",
      route: "nid",
      icon: Icons.badge,
      screen: const NidScreen(),
    ),
    ServiceModel(
      title: "Birth Certificate",
      category: "Government Services",
      route: "birth_certificate",
      icon: Icons.description,
      screen: const BirthScreen(),
    ),
    ServiceModel(
      title: "Passport Services",
      category: "Government Services",
      route: "passport",
      icon: Icons.book,
      screen: const PassportScreen(),
    ),
    ServiceModel(
      title: "Driving License",
      category: "Government Services",
      route: "driving_license",
      icon: Icons.card_membership,
      screen: const DrivingLicenseScreen(),
    ),
    ServiceModel(
      title: "Trade License",
      category: "Government Services",
      route: "trade_license",
      icon: Icons.business,
      screen: const TradeLicenseScreen(),
    ),
  ];

  @override
  String get searchFieldLabel => 'Search Services...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isEmpty) {
      return const Center(
        child: Text(
          "Type to search services...",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    final results = services.where((service) {
      return service.title.toLowerCase().contains(query.toLowerCase()) ||
          service.category.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (results.isEmpty) {
      return const Center(
        child: Text(
          "No services found!",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          leading: Icon(item.icon, color: AppColors.primaryGreen),
          title: Text(item.title),
          subtitle: Text(item.category),
          onTap: () {
            HistoryService.addHistory(
              item.title,
              item.category,
              item.route,
            );

            close(context, null);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item.screen),
            );
          },
        );
      },
    );
  }
}