import 'package:flutter/material.dart';
import 'screens/history_service.dart';
import 'screens/main_navigation.dart';
import 'utils/app_colors.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await HistoryService.loadHistory();

  runApp(const SmartNagorikSebaBD());
}

class SmartNagorikSebaBD extends StatelessWidget {
  const SmartNagorikSebaBD({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Nagorik Seba BD',
      theme: ThemeData(
        primaryColor: AppColors.primaryGreen,
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryGreen,
          foregroundColor: AppColors.white,
        ),
      ),
      home: const MainNavigation(),
    );
  }
}