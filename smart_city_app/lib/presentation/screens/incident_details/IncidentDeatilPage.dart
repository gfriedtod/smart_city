// Fichier : lib/pages/incident_detail_page.dart

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_city_app/domain/dto/IncidentDto.dart';
import 'package:smart_city_app/domain/dto/change_incident_status_request.dart';
import 'package:smart_city_app/presentation/components/button_comp.dart';

// Correction des imports - Assurez-vous que ces chemins sont corrects dans votre projet
// import 'package:your_app_name/data/incident_data.dart'; // Exemple : 'package:your_app_name/data/incident_data.dart';
// import 'package:your_app_name/models/incident.dart';

import '../../../../fake_core/data/model/incident.dart';
import '../../providers/incident/incident_bloc.dart'; // Exemple : 'package:your_app_name/models/incident.dart';
// import '../../components/IncidentCard.dart'; // Ce composant n'est pas utilisé directement dans cette page

class IncidentDetailPage extends StatefulWidget {
  final IncidentDto incident; // La page reçoit un seul incident

  const IncidentDetailPage({super.key, required this.incident});

  @override
  State<IncidentDetailPage> createState() => _IncidentDetailPageState();
}

class _IncidentDetailPageState extends State<IncidentDetailPage> {
  late IncidentStatus _currentStatus; // Le statut actuel de l'incident affiché

  @override
  void initState() {
    super.initState();
    // Le statut actuel est initialisé avec le statut initial de l'incident
    _currentStatus = widget.incident.status!;
  }

  // Méthode pour afficher la feuille de statut (bottom sheet)
  void _showStatusChangeSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Change Incident Status',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You are about to change this status',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: <Widget>[
                  _buildStatusButton(
                    IncidentStatus.SUBMIT,
                    Colors.deepPurple,
                    widget.incident,
                  ),
                  _buildStatusButton(
                    IncidentStatus.PROGRESS,
                    Colors.orange,
                    widget.incident,
                  ),
                  _buildStatusButton(
                    IncidentStatus.RESOLVED,
                    Colors.green,
                    widget.incident,
                  ),
                  _buildStatusButton(
                    IncidentStatus.REJECTED,
                    Colors.red,
                    widget.incident,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // **Note: Cette liste _disasterArticles n'est pas utilisée dans cette page de détails d'incident.**
  // final List<Incident> _disasterArticles = IncidentArticlesData;

  // Widget pour un bouton de statut dans la feuille
  Widget _buildStatusButton(
    IncidentStatus status,
    Color color,
    IncidentDto incident,
  ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context); // Ferme la bottom sheet
        _showConfirmationDialog(
          status,
          incident,
        ); // Affiche la boîte de dialogue de confirmation
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(
        status.name,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  // Méthode pour afficher la boîte de dialogue de confirmation
  void _showConfirmationDialog(IncidentStatus newStatus, IncidentDto incident) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text('Confirmation'),
          content: Text(
            'Are you sure you want to change the status to "${newStatus.name}"?',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme le dialogue
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            BlocConsumer<IncidentBloc, IncidentState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  updated: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Statut mis à jour avec succès'),
                      ),
                    );
                    setState(() {
                      _currentStatus = newStatus;
                      context.pop(); // Met à jour le statut
                    });
                  },
                  error: (error) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(error)));
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => ButtonComp(
                    title: 'Confirm',
                    onPressed: () {
                      context.read<IncidentBloc>().add(
                        IncidentEvent.updateIncident(
                          incident: ChangeIncidentStatusRequest(
                            id: incident.id,
                            status: newStatus,),
                        ),
                      );
                    },
                  ),
                  loading: () => ButtonComp(
                    title: 'Loading...',
                    onPressed: () {},
                    isLoading: true,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2, top: 5),
                  child: CachedNetworkImage(
                    imageUrl:
                        widget.incident.image ??
                        'https://ifthknoghckblnvnkbld.supabase.co/storage/v1/object/public/avatars/56a14781-1822-4a0c-8fc8-ac985405f2071748999119692.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                    children: [
                      Image.asset(
                        'lib/assets/images/map.png', // Assurez-vous que ce chemin est correct. 'lib/assets/images/map.png' n'est généralement pas le bon chemin pour les assets.
                        width: 18,
                        height: 18,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.incident.address?.length == 0
                            ? 'N/A'
                            : widget.incident.address!.length > 30
                            ? '${widget.incident.address!.substring(0, 30)}...'
                            : widget.incident.address ?? 'N/A',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.incident.name ?? 'N/A',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget
                        .incident
                        .description!, // Supprimé le '!' car 'description' est requis dans le modèle
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            // Conteneur pour le statut initial / actuel
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: _getStatusColor(
                                  _currentStatus,
                                ), // <-- Utilisez _currentStatus pour la couleur
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.solidCommentDots,
                                    size: 16,
                                    color: Colors.white,
                                  ), // Icône blanche pour contraste
                                  const SizedBox(width: 8),
                                  Text(
                                    _currentStatus
                                        .name, // <-- Affiche le statut actuel
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ), // Texte blanc
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Conteneur de la date
                            Container(
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
                                  const FaIcon(
                                    FontAwesomeIcons.calendarDays,
                                    size: 16,
                                    color: Colors.black87,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    DateFormat(
                                      'dd MMM,yyyy',
                                    ).format(widget.incident.createdAt!),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),

                        // Bouton de changement de statut
                        GestureDetector(
                          onTap: _showStatusChangeSheet,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Colors.green[800], // <-- Couleur fixe verte
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              // <-- Utilisez const si possible
                              children: [
                                Text(
                                  'Status', // <-- Texte fixe "Change Status"
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.menu, size: 16, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
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
                                latitude:
                                    widget.incident.latitude ?? 47.4358055,
                                longitude:
                                    widget.incident.longitude ?? 8.4737324,
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
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.incident.address?.length == 0
                                  ? 'N/A'
                                  : widget.incident.address!.length > 30
                                  ? '${widget.incident.address!.substring(0, 30)}...'
                                  : widget.incident.address ?? 'N/A',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text("📅 Sun, 11 June 2024"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fonction utilitaire pour obtenir la couleur du statut
  Color _getStatusColor(IncidentStatus status) {
    switch (status) {
      case IncidentStatus.SUBMIT:
        return Colors.deepPurple;
      case IncidentStatus.PROGRESS:
        return Colors.orange;
      case IncidentStatus.RESOLVED: // Ancien 'Resolved'
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
