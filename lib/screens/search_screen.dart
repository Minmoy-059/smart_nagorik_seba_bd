import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> services = [
    "Bus",
    "Train",
    "Launch",
    "Hospital",
    "Emergency",
    "Maps",
    "Weather",
    "News & Alerts",
    "NID",
    "Birth Certificate",
    "Passport",
    "Driving License",
    "Trade License",
  ];

  List<String> filteredServices = [];

  @override
  void initState() {
    super.initState();
    filteredServices = services;
  }

  void searchService(String value) {
    setState(() {
      filteredServices = services
          .where(
            (service) => service.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Search Services"),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              onChanged: searchService,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredServices.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.search,
                      color: Colors.green,
                    ),
                    title: Text(filteredServices[index]),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}