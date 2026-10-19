import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/app_colors.dart';
import 'history_service.dart';

import 'bus_screen.dart';
import 'train_screen.dart';
import 'launch_screen.dart';
import 'hospital_screen.dart';
import 'emergency_screen.dart';
import 'maps_screen.dart';
import 'weather_screen.dart';
import 'news_screen.dart';

import 'nid_screen.dart';
import 'birth_screen.dart';
import 'passport_screen.dart';
import 'driving_license_screen.dart';
import 'trade_license_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  

  // Step-1: Search controllers and query state
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final Map<String, WidgetBuilder> _routes = {
    "bus": (_) => const BusScreen(),
    "train": (_) => const TrainScreen(),
    "launch": (_) => const LaunchScreen(),
    "hospital": (_) => const HospitalScreen(),
    "emergency": (_) => const EmergencyScreen(),
    "maps": (_) => const MapsScreen(),
    "weather": (_) => const WeatherScreen(),
    "news": (_) => const NewsScreen(),
    "nid": (_) => const NidScreen(),
    "birth_certificate": (_) => const BirthScreen(),
    "passport": (_) => const PassportScreen(),
    "driving_license": (_) => const DrivingLicenseScreen(),
    "trade_license": (_) => const TradeLicenseScreen(),
  };

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

 void _loadData() {
  setState(() {});
  }

  void _navigateToRoute(String routeKey) {
    final builder = _routes[routeKey];
    if (builder != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: builder),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Service not found"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Step-3: Filtered list from Search Query
    final filteredHistory = HistoryService.searchHistory(_searchQuery);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              switch (value) {
                case "hour":
                  await HistoryService.clearLastHour();
                  break;
                case "today":
                  await HistoryService.clearToday();
                  break;
                case "week":
                  await HistoryService.clearWeek();
                  break;
                case "month":
                  await HistoryService.clearMonth();
                  break;
                case "all":
                  await HistoryService.clearAll();
                  break;
              }
              _loadData();
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: "hour",
                child: Text("🕐 Clear Last Hour"),
              ),
              PopupMenuItem(
                value: "today",
                child: Text("📅 Clear Today"),
              ),
              PopupMenuItem(
                value: "week",
                child: Text("📆 Clear This Week"),
              ),
              PopupMenuItem(
                value: "month",
                child: Text("🗓 Clear This Month"),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: "all",
                child: Text("🗑 Clear All"),
              ),
            ],
          ),
        ],
      ),
      // Step-2: Updated Body layout with Column
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search History",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = "";
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: filteredHistory.isEmpty
                ? const Center(
                    child: Text(
                      "No History Found",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    // Step-4: Filtered item count
                    itemCount: filteredHistory.length,
                    itemBuilder: (context, index) {
                      // Step-5: Item derived from filtered list
                      final item = filteredHistory[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: AppColors.primaryGreen,
                            child: Icon(
                              Icons.history,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            item.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              Text(item.category),
                              Text(
                                "📅 ${DateFormat("dd MMM yyyy").format(item.dateTime)}",
                              ),
                              Text(
                                "🕒 ${DateFormat("hh:mm a").format(item.dateTime)}",
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              await HistoryService.deleteHistory(item);
                              _loadData();
                            },
                          ),
                          onTap: () => _navigateToRoute(item.route),
                        ),
                      );
                    },
                  ),
          ), // Step-6: Closing Expanded
        ], // Step-6: Closing Column
      ),
    );
  }
}