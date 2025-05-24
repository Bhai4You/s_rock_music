import 'package:flutter/material.dart';

import '../../home/home_screen.dart';
import '../../news/news_screen.dart';
import '../../projects/projects_screen.dart';
import '../../trackbox/trackbox_screen.dart';

class DashboardProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Widget getScreen() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return NewsScreen();
      case 2:
        return TrackBoxScreen();
      case 3:
        return ProjectsScreen();
      default:
        return HomeScreen();
    }
  }
}
