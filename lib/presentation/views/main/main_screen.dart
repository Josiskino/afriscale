import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constants/app_colors.dart';

import '../../widgets/custom_bottom_nav_bar/custom_bottom_nav_bar_item.dart';
import '../../widgets/custom_bottom_nav_bar/custum_bottom_nav_bar.dart';
import '../home/home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTab = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const Scaffold(body: Center(child: Text('Favorites'))), // Placeholder
    const Scaffold(body: Center(child: Text('Address Book'))), // Placeholder
    const Scaffold(body: Center(child: Text('Settings'))), // Placeholder
    const Scaffold(body: Center(child: Text('Settings'))), // Placeholder
  ];

  void onTabSelected(int index) {
    setState(() {
      currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(
        unSelectedColor: isDarkMode
            ? AppColors.subTextColorDark
            : AppColors.subTextColorLight,
        selectedColor: Theme.of(context).colorScheme.primary,
        onTap: onTabSelected,
        selectedTab: currentTab,
        children: const [
          CustomBottomAppBarItem(
            icon: Iconsax.home,
            text: "Home",
          ),
          CustomBottomAppBarItem(
            icon: Icons.shopping_bag_outlined,
            text: "Orders",
          ),
          CustomBottomAppBarItem(
            icon: Iconsax.chart_2,
            text: "Chart",
          ),
          CustomBottomAppBarItem(
            icon: Icons.groups_outlined,
            text: "Clients",
          ),
          CustomBottomAppBarItem(
            icon: Iconsax.setting,
            text: "Settings",
          ),
        ],
      ),
      body: screens[currentTab],
    );
  }
}