import 'package:flutter/material.dart';
import '../widgets/search_box.dart';
import '../widgets/section_title.dart';
import '../widgets/service_card.dart';
import '../utils/app_colors.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "স্মার্ট নাগরিক সেবা",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bangladesh.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SearchBox(),

              const SizedBox(height: 15),

              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "বাংলাদেশ ভিত্তিক নাগরিক সেবা অ্যাপে স্বাগতম",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// =======================
              /// Public Transport
              /// =======================

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SectionTitle(
                  title: "Public Transport",
                  icon: Icons.directions_bus,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ServiceCard(
                    title: "Bus",
                    icon: Icons.directions_bus,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BusScreen(),
                        ),
                      );
                    },
                  ),

                  ServiceCard(
                    title: "Train",
                    icon: Icons.directions_train,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TrainScreen(),
                        ),
                      );
                    },
                  ),

                  ServiceCard(
                    title: "Launch",
                    icon: Icons.directions_boat,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LaunchScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// =======================
              /// Public Services
              /// =======================

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SectionTitle(
                  title: "Public Services",
                  icon: Icons.public,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ServiceCard(
                    title: "Hospital",
                    icon: Icons.local_hospital,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HospitalScreen(),
                        ),
                      );
                    },
                  ),

                  ServiceCard(
                    title: "Emergency",
                    icon: Icons.emergency,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EmergencyScreen(),
                        ),
                      );
                    },
                  ),

                  ServiceCard(
                    title: "Maps",
                    icon: Icons.map,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MapsScreen(),
                        ),
                      );
                    },
                  ),

                ],
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ServiceCard(
                    title: "Weather",
                    icon: Icons.cloud,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WeatherScreen(),
                        ),
                      );
                    },
                  ),

                  ServiceCard(
                    title: "News & Alerts",
                    icon: Icons.newspaper,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NewsScreen(),
                        ),
                      );
                    },
                  ),

                ],
              ),

              const SizedBox(height: 30),

                           /// =======================
              /// Government Services
              /// =======================

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SectionTitle(
                  title: "Verified Government Services",
                  icon: Icons.verified_user,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ServiceCard(
                    title: "NID",
                    icon: Icons.badge,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NidScreen(),
                        ),
                      );
                    },
                  ),

                  ServiceCard(
                    title: "Birth Certificate",
                    icon: Icons.description,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BirthScreen(),
                        ),
                      );
                    },
                  ),

                  ServiceCard(
                    title: "Passport",
                    icon: Icons.book,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PassportScreen(),
                        ),
                      );
                    },
                  ),

                ],
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ServiceCard(
                    title: "Driving License",
                    icon: Icons.card_membership,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DrivingLicenseScreen(),
                        ),
                      );
                    },
                  ),

                  ServiceCard(
                    title: "Trade License",
                    icon: Icons.business,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TradeLicenseScreen(),
                        ),
                      );
                    },
                  ),

                ],
              ),

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}