import 'package:flutter/material.dart';
import 'package:smart_city_app/fake_core/data/IncidentCard_data.dart';
import 'package:smart_city_app/presentation/components/IncidentCard.dart';

import '../profile/ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreenContent(),
    const Placeholder(), // Ajout d’incident
    const Placeholder(), // Notifications
    const ProfilePage(), // Vers la page de profil
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  final List<String> categories = const [
    "Infrastructure",
    "Hygiène",
    "Sécurité",
    "Environnement",
    "Circulation",
    "Éclairage publique",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Map & Info
            Stack(
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                  ),
                  child: const Center(child: Text(" Map View Placeholder")),
                ),
                const Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(Icons.settings),
                ),
                const Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Earthquake in New York",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("📅 Sun, 11 June 2024    ⏱ 3 min ago"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Title section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recent Incidents",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text("See all", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),

            // Categories
            SizedBox(
              height: 35,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final isSelected = index == 0;
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green.shade800 : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? Colors.green.shade800
                            : Colors.grey.shade200,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // List of Incidents
            Expanded(
              child: ListView.builder(
                itemCount: IncidentArticlesData.length,
                itemBuilder: (context, index) =>
                    IncidentcardListItem(incident: IncidentArticlesData[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
