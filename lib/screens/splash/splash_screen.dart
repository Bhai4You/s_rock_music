import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:music_service_module/screens/dashboard/dashboard_screen.dart';
import 'package:music_service_module/utils/constants/app_images.dart';
import 'package:music_service_module/utils/helpers/app_textstyles.dart';

import '../../utils/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.roseLight, AppColors.roseDark],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff6db1ff).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppImages.iconDisk,
                      height: 40,
                      width: 40,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.2, end: 0, duration: 500.ms)
                  .shimmer(delay: 1.seconds, duration: 1500.ms),
              SizedBox(height: size.height * 0.02),
              Text('S.Rocks Music', style: AppTextStyles.headlineLarge()),
            ],
          ),
        ),
      ),
    );
  }
}
