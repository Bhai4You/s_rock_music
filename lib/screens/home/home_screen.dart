import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:music_service_module/screens/home/provider/home_provider.dart';
import 'package:music_service_module/screens/home/widgets/service_card_widget.dart';
import 'package:music_service_module/utils/constants/app_colors.dart';
import 'package:music_service_module/utils/constants/app_images.dart';
import 'package:music_service_module/utils/helpers/app_textstyles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void fetchServices() {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && homeProvider.services.isEmpty) {
        homeProvider.fetchServices();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.roseLight,
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  style: AppTextStyles.syne(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search "Punjabi Lyrics"',
                    border: InputBorder.none,
                    hintStyle: AppTextStyles.syne(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.lightGrey,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ), // Add search icon as prefix
                    suffixIcon: Icon(Icons.mic, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightPink,
            ),
            child: Icon(Icons.person),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return RefreshIndicator(
            onRefresh: () async {
              await homeProvider.fetchServices();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          gradient: LinearGradient(
                            colors: [AppColors.roseLight, AppColors.roseDark],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Claim your', style: AppTextStyles.syne()),
                            Text(
                              'Free Demo',
                              style: AppTextStyles.headlineLarge(),
                            ),
                            Text(
                              'for custom Music Production',
                              style: AppTextStyles.syne(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Text(
                                  'Book Now',
                                  style: AppTextStyles.syne(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Positioned(
                        left: -25,
                        bottom: 20,
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.asset(AppImages.iconDisk),
                        ),
                      ).animate().rotate(
                        duration: 1.seconds,
                        curve: Curves.easeIn,
                        begin: 0,
                        end: 1,
                      ),
                      Positioned(
                        right: -60,
                        bottom: 20,

                        child: Container(
                          height: 150,
                          width: 150,
                          child: Image.asset(AppImages.iconPiano),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'Hire hand-picked Pros for popular music services',
                        style: AppTextStyles.syne(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Consumer<HomeProvider>(
                    builder: (context, homeProvider, child) {
                      if (homeProvider.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.roseLight,
                          ),
                        );
                      }
                      if (homeProvider.error != null) {
                        return Center(
                          child: Text('Error: ${homeProvider.error}'),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: homeProvider.services.length,
                          itemBuilder: (context, index) {
                            final service = homeProvider.services[index];
                            return ServiceCard(service: service);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
