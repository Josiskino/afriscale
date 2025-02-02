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

  // Ajoutons un index spécial pour le bouton central
  static const int centerButtonIndex = 2; 

  final List<Widget> screens = [
    const HomeScreen(),
    //const OtpVerificationScreen(phoneNumber: '+22898177115',),
    //const FavouriteScreen(),
   
  ];

  void onTabSelected(int index) {
    setState(() {
      // Ajuster l'index en fonction du bouton central
      if (index >= centerButtonIndex) {
        currentTab = index + 1; // Skip the center button index
      } else {
        currentTab = index;
      }
    });
  }

  void onCenterButtonTap() {
    setState(() {
      currentTab = centerButtonIndex; // Utiliser l'index du bouton central
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
        selectedTab: currentTab == centerButtonIndex ? -1 : currentTab > centerButtonIndex ? currentTab - 1 : currentTab,
        onCenterButtonTap: onCenterButtonTap,
         isSelected: currentTab == centerButtonIndex,
        children: const [
          CustomBottomAppBarItem(
            icon: Iconsax.home,
            text: "Home",
          ),
          CustomBottomAppBarItem(
            icon: Icons.favorite_outline,
            text: "Favourites",
          ),
          CustomBottomAppBarItem(
            icon: Icons.assignment_outlined,
            text: "Address Book",
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