import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_city_app/domain/dto/CategoryDto.dart';
import 'package:smart_city_app/domain/dto/IncidentDto.dart';
import 'package:smart_city_app/fake_core/data/IncidentCard_data.dart';
import 'package:smart_city_app/fake_core/data/model/incident.dart';
import 'package:smart_city_app/fake_core/data/model/incident.dart';
import 'package:smart_city_app/presentation/components/IncidentCard.dart';

import '../../../core/constants/route.dart';
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

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
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
    print(ModalRoute.of(context)?.settings.name);
    print(ModalRoute.of(context)?.settings.name == RoutesPath.home.path);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<IncidentBloc, IncidentState>(
          listenWhen: (previous, current) {
            return previous != current &&
                ModalRoute.of(context)?.settings.name == RoutesPath.home.path;
          },

          // buildWhen: (previous, current) {
          //   return previous != current &&
          //       ModalRoute.of(context)?.settings.name ==
          //           RoutesPath.root.path.replaceAll('/', '');
          // },
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

class MockData extends StatefulWidget {
  const MockData({
    super.key,
    required this.categories,
    required this.incidents,
  });

  final List<CategoryDto> categories;
  final List<IncidentDto> incidents;

  @override
  State<MockData> createState() => _MockDataState();
}

class _MockDataState extends State<MockData>
    with SingleTickerProviderStateMixin {
  final List<FlSpot> _lineChartSpots = [
    const FlSpot(0, 30),
    const FlSpot(1, 32),
    const FlSpot(2, 35),
    const FlSpot(3, 38),
    const FlSpot(4, 42), // Point d'intérêt
    const FlSpot(5, 40),
    const FlSpot(6, 39),
  ];

  late TabController _tabController;
  String _selectedFilter = '1W'; // Filtre par défaut pour le graphique linéaire
  DateTime _selectedDate =
      DateTime.now(); // Date par défaut pour le filtre date
  int _touchedSpotIndex = -1; // Pour gérer l'effet de survol sur le graphique

  int _currentTabIndex = 0;

  int selectedIndex = 0;
  List<IncidentDto> incidentsFiltered = [];
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categorys = context.watch<IncidentBloc>().categorys;
    final incidents = context.watch<IncidentBloc>().incidents;
    setState(() {
      incidentsFiltered = incidents;

    });
    Widget _buildFilterButton(String text) {
      bool isSelected = _selectedFilter == text;
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedFilter = text;
            // Ici, vous mettriez à jour _lineChartSpots en fonction du filtre
            // Pour l'exemple, les spots restent les mêmes.
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
        ),
      );
    }

    Widget _buildLineChartTab() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filtres (1D, 1W, 4M, 8M, All, Date)
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton('1D'),
                _buildFilterButton('1W'),
                _buildFilterButton('4M'),
                _buildFilterButton('8M'),
                _buildFilterButton('All'),
                GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 18,
                          color: Colors.black87,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          DateFormat('MMM yyyy').format(_selectedDate),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SizedBox(
              height: 280,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 16.0),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: false,
                      drawVerticalLine: true,
                      horizontalInterval: 10,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(color: Colors.grey[200]!, strokeWidth: 1);
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(color: Colors.grey[200]!, strokeWidth: 1);
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            const style = TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            Widget text;
                            switch (value.toInt()) {
                              case 0:
                                text = const Text('Jan', style: style);
                                break;
                              case 1:
                                text = const Text('Feb', style: style);
                                break;
                              case 2:
                                text = const Text('Mar', style: style);
                                break;
                              case 3:
                                text = const Text('Apr', style: style);
                                break;
                              case 4:
                                text = const Text('May', style: style);
                                break;
                              case 5:
                                text = const Text('Jun', style: style);
                                break;
                              default:
                                text = const Text('', style: style);
                                break;
                            }
                            return SideTitleWidget(meta: meta, child: text);
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 10,
                          getTitlesWidget: (value, meta) {
                            const style = TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            return Text(
                              '${value.toInt()}',
                              style: style,
                              textAlign: TextAlign.left,
                            );
                          },
                          reservedSize: 42,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                      border: Border.all(color: Colors.grey[300]!, width: 1),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _lineChartSpots,
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: [Colors.green, Colors.green.withOpacity(0.4)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        barWidth: 5,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: _touchedSpotIndex == index
                                  ? 6
                                  : 4, // Agrandir le point touché
                              color: _touchedSpotIndex == index
                                  ? primaryColor!
                                  : Colors.white,
                              strokeWidth: _touchedSpotIndex == index ? 3 : 1,
                              strokeColor: _touchedSpotIndex == index
                                  ? Colors.white
                                  : Colors.grey[400]!,
                            );
                          },
                        ),
                        // belowBarData: BarAreaData(
                        //   show: true,
                        //   gradient: LinearGradient(
                        //     colors: [
                        //       Colors.green.withOpacity(0.3),
                        //       Colors.green.withOpacity(0.0),
                        //     ],
                        //     begin: Alignment.bottomCenter,
                        //     end: Alignment.topCenter,
                        //   ),
                        // ),
                      ),
                    ],
                    minX: 0,
                    maxX: _lineChartSpots.length - 1,
                    minY: 0,
                    maxY: 50,
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        // tooltipBgColor: primaryColor,
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((LineBarSpot touchedSpot) {
                            return LineTooltipItem(
                              '${touchedSpot.y.toInt()}+ Disaster',
                              // Format de survol "30+ Disaster"
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }).toList();
                        },
                      ),
                      handleBuiltInTouches: true,
                      getTouchedSpotIndicator: (barData, spotIndexes) {
                        return spotIndexes.map((index) {
                          return TouchedSpotIndicatorData(
                            FlLine(
                              color: Colors.transparent,
                              strokeWidth: 0,
                            ), // Ligne transparente
                            FlDotData(
                              show: false,
                            ), // Le point est déjà géré par getDotPainter
                          );
                        }).toList();
                      },
                      touchCallback:
                          (
                            FlTouchEvent event,
                            LineTouchResponse? touchResponse,
                          ) {
                            setState(() {
                              if (touchResponse != null &&
                                  touchResponse.lineBarSpots != null &&
                                  touchResponse.lineBarSpots!.isNotEmpty) {
                                _touchedSpotIndex =
                                    touchResponse.lineBarSpots![0].spotIndex;
                              } else {
                                _touchedSpotIndex =
                                    -1; // Réinitialise si aucun point n'est touché
                              }
                            });
                          },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistiques',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),

          // Barre d'onglets
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black54,
              tabs: const [
                Tab(text: 'Graphique'),
                Tab(text: 'Map'),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Contenu des onglets
          SizedBox(
            height: 280, // Hauteur fixe pour les contenus des onglets
            child: TabBarView(
              controller: _tabController,
              children: [
                Expanded(child: _buildLineChartTab()),
                // Onglet pour le graphique linéaire
                // _buildCircularChartTab(),
                // Onglet pour le graphique circulaire
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
              ],
            ),
          ),
          const SizedBox(height: 30),

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
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categorys.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      incidentsFiltered = incidents
                          .where(
                            (incident) =>
                                incident.category?.id == categorys[index].id,
                          )
                          .toList();
                    });
                    print('Catégorie sélectionnée : ${categorys[index]}');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? Colors.transparent : Colors.grey,
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
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // List of Incidents
          SizedBox(
            height: 300,
            child: Expanded(
              child: ListView.builder(
                itemCount: incidentsFiltered.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.push(
                      RoutesPath.incidentDetails.path,
                      extra: incidentsFiltered[index],
                    );
                  },
                  child: IncidentcardListItem(incident: incidentsFiltered[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
