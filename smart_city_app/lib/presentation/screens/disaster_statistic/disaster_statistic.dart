// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class AgentHomePage extends StatefulWidget {
//   const AgentHomePage({super.key});
//
//   @override
//   State<AgentHomePage> createState() => _AgentHomePageState();
// }
//
// class _AgentHomePageState extends State<AgentHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   //HI ALEX
//                   Text('Howday 👋ALEX!', style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 23,
//                     fontWeight: FontWeight.bold
//                   )
//                   ),
//
//                   //PROFILE LOGO
//                   Container(
//                     height: 60,
//                     width: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[600],
//                       borderRadius: BorderRadius.circular(50)
//                     ),
//                     child: Icon(
//                       Icons.notifications,
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Fichier : lib/pages/disaster_statistics_page.dart

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart'; // Pour la date

import '../../../fake_core/data/IncidentCard_data.dart';
import '../../../fake_core/data/model/incident.dart';
import '../../components/IncidentCard.dart';
import '../onboarding/color.dart';

class DisasterStatisticsPage extends StatefulWidget {
  const DisasterStatisticsPage({super.key});

  @override
  State<DisasterStatisticsPage> createState() => _DisasterStatisticsPageState();
}

class _DisasterStatisticsPageState extends State<DisasterStatisticsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedFilter = '1W'; // Filtre par défaut pour le graphique linéaire
  DateTime _selectedDate =
      DateTime.now(); // Date par défaut pour le filtre date
  int _touchedSpotIndex = -1; // Pour gérer l'effet de survol sur le graphique

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Données pour le graphique linéaire (simule une tendance pour 1W, 1M, etc.)
  // Ces données devraient être adaptées dynamiquement en fonction du filtre sélectionné
  final List<FlSpot> _lineChartSpots = [
    const FlSpot(0, 30),
    const FlSpot(1, 32),
    const FlSpot(2, 35),
    const FlSpot(3, 38),
    const FlSpot(4, 42), // Point d'intérêt
    const FlSpot(5, 40),
    const FlSpot(6, 39),
  ];

  // Données pour le graphique circulaire
  final List<PieChartSectionData> _pieChartSections = [
    PieChartSectionData(
      color: Colors.deepPurple,
      value: 50.0,
      title: '50.0',
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titlePositionPercentageOffset: 1.5,
    ),
    PieChartSectionData(
      color: Colors.blue,
      value: 20.0,
      title: '20.0',
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titlePositionPercentageOffset: 1.5,
    ),
    PieChartSectionData(
      color: Colors.orange,
      value: 20.0,
      title: '20.0',
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titlePositionPercentageOffset: 1.5,
    ),
    PieChartSectionData(
      color: Colors.redAccent,
      value: 5.0,
      title: '5.0',
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titlePositionPercentageOffset: 1.5,
    ),
    PieChartSectionData(
      color: Colors.teal,
      value: 5.0,
      title: '5.0',
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titlePositionPercentageOffset: 1.5,
    ),
  ];

  // // Structure de données pour les articles de la liste des catastrophes
  final List<Incident> _disasterArticles = IncidentArticlesData;

  @override
  Widget build(BuildContext context) {
    final List<String> categories = const [
      "Infrastructure",
      "Hygiène",
      "Sécurité",
      "Environnement",
      "Circulation",
      "Éclairage publique",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Gérer les options supplémentaires
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Pour permettre le défilement de toute la page
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                  Tab(text: 'Répartition'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Contenu des onglets
            SizedBox(
              height: 350, // Hauteur fixe pour les contenus des onglets
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildLineChartTab(),
                  // Onglet pour le graphique linéaire
                  _buildCircularChartTab(),
                  // Onglet pour le graphique circulaire
                ],
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              'Disaster List',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
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

            // Liste des catastrophes
            SizedBox(
              height: 600,
              child: ListView.builder(
                shrinkWrap: true,
                // Important pour que ListView.builder fonctionne dans un SingleChildScrollView
                // Désactive le défilement du ListView lui-même
                itemCount: _disasterArticles.length,
                itemBuilder: (context, index) {
                  return IncidentcardListItem(
                    incident: _disasterArticles[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widget pour l'onglet du graphique linéaire (Image 1) ---
  Widget _buildLineChartTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filtres (1D, 1W, 4M, 8M, All, Date)
        Row(
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
        const SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: Expanded(
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
                        (FlTouchEvent event, LineTouchResponse? touchResponse) {
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

  // --- Widget pour l'onglet du graphique circulaire (Image 2) ---
  Widget _buildCircularChartTab() {
    return Column(
      children: [
        const Text(
          'rezgar', // Texte central comme sur l'image
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: PieChart(
            PieChartData(
              sections: _pieChartSections,
              centerSpaceRadius: 80,
              // Rayon de l'espace central pour faire un donut
              borderData: FlBorderData(show: false),
              sectionsSpace: 4,
              // Espace entre les sections
              // touchData est important si vous voulez interagir avec les sections
              pieTouchData: PieTouchData(
                touchCallback:
                    (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
                      // Gérer les interactions si nécessaire
                    },
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Légende en bas
        Wrap(
          spacing: 12, // Espacement horizontal entre les éléments de la légende
          runSpacing: 8, // Espacement vertical entre les lignes de la légende
          alignment: WrapAlignment.center,
          children: _pieChartSections.map((data) {
            return _buildLegendItem(data.color, data.value.toInt().toString());
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Occupe seulement l'espace nécessaire
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }

  // --- Widget pour un élément de la liste des catastrophes (Image 3) ---
  Widget _buildDisasterListItem(Map<String, dynamic> disaster) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.0),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // Changement de position de l'ombre
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image à gauche
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              disaster['image']!,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          // Détails au centre
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  disaster['title']!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset(
                      'lib/assets/images/map.png',
                      // Remplacez par le nom de votre fichier
                      width: 15, // Ajustez la largeur
                      height: 15, // Ajustez la hauteur
                      color: Colors
                          .blueGrey[700], // Vous pouvez appliquer une teinte de couleur si c'est un PNG monochromatique
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        disaster['location']!,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.calendarDays,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      DateFormat(
                        'dd MMM, yyyy',
                      ).format(disaster['date']!), // Formatage de la date
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 10),
                    // FaIcon(FontAwesomeIcons.hourglassHalf, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 5),
                  ],
                ),
              ],
            ),
          ),
          // Bouton fléché à droite
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
