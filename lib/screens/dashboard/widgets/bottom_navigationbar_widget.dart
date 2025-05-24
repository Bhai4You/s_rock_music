import 'package:flutter/material.dart';
import 'package:music_service_module/screens/dashboard/provider/dashboard_provider.dart';
import 'package:music_service_module/utils/constants/app_colors.dart';
import 'package:music_service_module/utils/constants/app_images.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, child) {
        double tabWidth = MediaQuery.of(context).size.width / 4;
        double markerPosition =
            tabWidth * (dashboardProvider.selectedIndex + 0.5);
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.bottomBarColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BottomNavigationBar(
                  elevation: 0,
                  enableFeedback: false,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          AppImages.iconHome,
                          height: 24,
                          width: 24,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          AppImages.iconHome,

                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          AppImages.iconNews,

                          height: 24,
                          width: 24,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          AppImages.iconNews,

                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ),
                      ),
                      label: 'News',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          AppImages.iconTrackbox,

                          height: 24,
                          width: 24,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          AppImages.iconTrackbox,

                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ),
                      ),
                      label: 'TrackBox',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          AppImages.iconProjects,

                          height: 24,
                          width: 24,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          AppImages.iconProjects,

                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ),
                      ),
                      label: 'Projects',
                    ),
                  ],
                  currentIndex: dashboardProvider.selectedIndex,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: AppColors.bottomBarColor,
                  onTap: (value) {
                    dashboardProvider.updateSelectedIndex(value);
                  },
                  type: BottomNavigationBarType.fixed,
                ),
              ),
            ),
            Positioned(
              top: -5,
              left: markerPosition - 10,
              child: Container(
                width: 20,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
