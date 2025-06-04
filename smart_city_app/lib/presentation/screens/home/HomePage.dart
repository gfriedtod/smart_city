import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_city_app/domain/dto/CategoryDto.dart';
import 'package:smart_city_app/domain/dto/IncidentDto.dart';
import 'package:smart_city_app/fake_core/data/IncidentCard_data.dart';
import 'package:smart_city_app/fake_core/data/model/incident.dart';
import 'package:smart_city_app/fake_core/data/model/incident.dart';
import 'package:smart_city_app/presentation/components/IncidentCard.dart';

import '../../providers/incident/incident_bloc.dart';
import '../onboarding/color.dart';
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
    ProfilePage(), // Vers la page de profil
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(body: _pages[_currentIndex]);
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
        child: BlocConsumer<IncidentBloc, IncidentState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (message) => ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message))),
            );
          },
          builder: (context, state) {
            log(state.toString());
            return RefreshIndicator(
              onRefresh: () async {
                context.read<IncidentBloc>().add(IncidentEvent.getIncidents());
              },
              child: state.maybeWhen(
                orElse: () => _EmptyPage(),
                loaded: (incidents) => MockData(categories: [], incidents: []),
                loading: () =>
                    Skeletonizer(child: Mock(categories: categories)),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _EmptyPage extends StatelessWidget {
  const _EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("lib/assets/images/empty.png", width: 200, height: 200),
          const Text("Aucun incident"),
          IconButton(
            onPressed: () =>
                context.read<IncidentBloc>().add(IncidentEvent.getIncidents()),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class Mock extends StatelessWidget {
  const Mock({super.key, required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Map & Info
        Stack(
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100,
              ),
              child: Expanded(
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
            ),
            const Positioned(top: 10, right: 10, child: Icon(Icons.settings)),
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
                  color: isSelected ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? primaryColor : Colors.grey.shade200,
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
                IncidentcardListItem(incident: IncidentDto()),
          ),
        ),
      ],
    );
  }
}

class MockData extends StatelessWidget {
  const MockData({
    super.key,
    required this.categories,
    required this.incidents,
  });

  final List<CategoryDto> categories;
  final List<IncidentDto> incidents;

  @override
  Widget build(BuildContext context) {
    final categorys = context.watch<IncidentBloc>().categorys;
    final incidents = context.watch<IncidentBloc>().incidents;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Map & Info
        Stack(
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100,
              ),
              child: Expanded(
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
            ),
            const Positioned(top: 10, right: 10, child: Icon(Icons.settings)),
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
            itemCount: categorys.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final isSelected = index == 0;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? primaryColor : Colors.grey.shade200,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  categorys[index].name,
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
            itemCount: incidents.length,
            itemBuilder: (context, index) =>
                IncidentcardListItem(incident: incidents[index]),
          ),
        ),
      ],
    );
  }
}
