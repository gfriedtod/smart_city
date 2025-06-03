import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:smart_city_app/fake_core/data/IncidentCard_data.dart';
import 'package:smart_city_app/presentation/components/IncidentCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreenContent();
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  final List<String> categories = [
    "Infrastructure",
    "Hygiène",
    "Sécurité",
    "Environnement",
    "Circulation",
    "Éclairage publique",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Map
            Stack(
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100,
                  ),
                  child: OSMFlutter(
                    controller: MapController(
                      initPosition: GeoPoint(
                        latitude: 47.4358055,
                        longitude: 8.4737324,
                      ),
                      areaLimit: const BoundingBox(
                        east: 10.4922941,
                        north: 47.8084648,
                        south: 45.817995,
                        west: 5.9559113,
                      ),
                    ),
                    osmOption: OSMOption(
                      userTrackingOption: const UserTrackingOption(
                        enableTracking: true,
                        unFollowUser: false,
                      ),
                      zoomOption: const ZoomOption(
                        initZoom: 8,
                        minZoomLevel: 3,
                        maxZoomLevel: 19,
                        stepZoom: 1.0,
                      ),
                      userLocationMarker: UserLocationMaker(
                        personMarker: const MarkerIcon(
                          icon: Icon(
                            Icons.location_history_rounded,
                            color: Colors.red,
                            size: 48,
                          ),
                        ),
                        directionArrowMarker: const MarkerIcon(
                          icon: Icon(Icons.double_arrow, size: 48),
                        ),
                      ),
                      roadConfiguration: const RoadOption(
                        roadColor: Colors.yellowAccent,
                      ),
                    ),
                  ),
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
                      Text("Earthquake in New York", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("📅 Sun, 11 June 2024    ⏱ 3 min ago"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Incidents récents", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Voir tout", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),

            // Categories
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      print('Catégorie sélectionnée : ${categories[index]}');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green.shade800 : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Incident list
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
