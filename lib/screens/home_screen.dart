import 'package:flutter/material.dart';
import '../widgets/search_box.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "স্মার্ট নাগরিক সেবা",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bangladesh.jpeg'), // .png এক্সটেনশন ঠিক করা হলো
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          children: [
            SearchBox(),
            SizedBox(height: 20),
            Center(
              child: Text(
                "বাংলাদেশ ভিত্তিক নাগরিক সেবা অ্যাপে স্বাগতম",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.primaryRed,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}