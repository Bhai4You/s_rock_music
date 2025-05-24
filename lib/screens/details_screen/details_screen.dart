import 'package:flutter/material.dart';
import 'package:music_service_module/utils/constants/app_colors.dart';

import '../../utils/helpers/app_textstyles.dart';

class DetailScreen extends StatelessWidget {
  final String serviceTitle;
  const DetailScreen({super.key, required this.serviceTitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left, color: AppColors.white, size: 35),
        ),
        title: Text('Service Details', style: AppTextStyles.syne()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'You tapped on: $serviceTitle',
            style: AppTextStyles.syne(fontSize: 18),
          ),
          SizedBox(height: size.height * 0.02),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Back to Home',
                    style: AppTextStyles.syne(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
