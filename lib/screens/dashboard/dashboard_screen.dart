import 'package:flutter/material.dart';
import 'package:music_service_module/screens/dashboard/provider/dashboard_provider.dart';
import 'package:music_service_module/screens/dashboard/widgets/bottom_navigationbar_widget.dart';
import 'package:music_service_module/utils/constants/app_colors.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
          return Center(child: dashboardProvider.getScreen());
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
