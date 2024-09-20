import 'package:coffe_app/Views/favorite/views/favorite_screen.dart';
import 'package:coffe_app/Views/history/views/history_screen.dart';
import 'package:coffe_app/Views/home/views/home_screen.dart';
import 'package:coffe_app/Views/reward/views/reward_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationControllor extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> widgetList = const [
    HomeScreen(),
    FavoriteScreen(),
    HistoryScreen(),
    RewardScreen(),
  ];

  void isSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
