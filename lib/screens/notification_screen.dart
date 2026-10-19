import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: const Center(
        child: Text(
          "Notification Screen",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}