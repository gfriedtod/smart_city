import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smart_city_app/presentation/screens/disaster_statistic/disaster_statistic.dart';
import 'package:smart_city_app/presentation/screens/home/HomePage.dart';
import 'package:smart_city_app/presentation/screens/onboarding/color.dart';
import 'package:smart_city_app/presentation/screens/onboarding/onboardinpage.dart';
import 'package:smart_city_app/presentation/screens/profile/ProfilePage.dart';

import 'components/open_street_map_search_and_pick.dart';

class KernelView extends StatefulWidget {
  const KernelView({super.key});

  @override
  State<KernelView> createState() => _KernelViewState();
}

class _KernelViewState extends State<KernelView> {
  List<Widget> pages = [
    const HomePage(),
    ProfilePage(),
    const DisasterStatisticsPage(),
    OnboardingPage(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[index],
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                backgroundColor: Colors.white,
                body: OpenStreetMapSearchAndPick(
                  buttonColor: primaryColor,
                  locationPinIconColor: primaryColor,
                  buttonText: 'Set Current Location',
                  onPicked: (pickedData) async {},
                ),
              ),
            ),
          );
          // Navigator.push(context, MaterialPageRoute(builder: (context,) => const MenuInsertionPage()));
        },
        backgroundColor: primaryColor,
        child: const Icon(LucideIcons.plus, color: Colors.white),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: SizedBox(
        height: 60,
        child: AnimatedBottomNavigationBar(
          backgroundColor: Colors.white,
          activeColor: primaryColor,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          icons: const [
            LucideIcons.home,
            LucideIcons.list,
            LucideIcons.shoppingBag,
            LucideIcons.instagram,
          ],
          gapLocation: GapLocation.center,
          activeIndex: index,
          onTap: (item) => setState(() => index = item),
          //other params
        ),
      ),
    );
  }
}
