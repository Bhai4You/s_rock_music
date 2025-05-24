import 'package:flutter/material.dart';
import 'package:music_service_module/model/service_model.dart';
import 'package:music_service_module/screens/details_screen/details_screen.dart';
import 'package:music_service_module/utils/constants/app_images.dart';
import 'package:music_service_module/utils/helpers/app_textstyles.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;

  const ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(serviceTitle: service.title),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage('assets/images/${service.bgImagePath}.png'),
              fit: BoxFit.cover,
              opacity: 0.10,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 47,
                  width: 47,
                  decoration: BoxDecoration(
                    color: Color(0xff2F2F39),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/${service.iconPath}.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${service.title}',
                        style: AppTextStyles.syne(fontSize: 15),
                      ),
                      Text(
                        '${service.title}',
                        style: AppTextStyles.syne(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  child: Image.asset(AppImages.iconRightforward),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
