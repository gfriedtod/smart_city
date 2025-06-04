// Fichier : lib/pages/incident_detail_page.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

// Correction des imports - Assurez-vous que ces chemins sont corrects dans votre projet
// import 'package:your_app_name/data/incident_data.dart'; // Exemple : 'package:your_app_name/data/incident_data.dart';
// import 'package:your_app_name/models/incident.dart';

import '../../../../fake_core/data/model/incident.dart'; // Exemple : 'package:your_app_name/models/incident.dart';
// import '../../components/IncidentCard.dart'; // Ce composant n'est pas utilisé directement dans cette page

class IncidentDetailPage extends StatefulWidget {
  final Incident incident; // La page reçoit un seul incident

  const IncidentDetailPage({super.key, required this.incident});

  @override
  State<IncidentDetailPage> createState() => _IncidentDetailPageState();
}

class _IncidentDetailPageState extends State<IncidentDetailPage> {
  late String _currentStatus; // Le statut actuel de l'incident affiché

  @override
  void initState() {
    super.initState();
    // Le statut actuel est initialisé avec le statut initial de l'incident
    _currentStatus = widget.incident.initialStatus!;
  }

  // Méthode pour afficher la feuille de statut (bottom sheet)
  void _showStatusChangeSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
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
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: <Widget>[
                  _buildStatusButton('Reported', Colors.deepPurple),
                  _buildStatusButton('In_Progress', Colors.orange),
                  _buildStatusButton('Resolved', Colors.green),
                  _buildStatusButton('Rejected', Colors.red),
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
  Widget _buildStatusButton(String status, Color color) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context); // Ferme la bottom sheet
        _showConfirmationDialog(status); // Affiche la boîte de dialogue de confirmation
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  // Méthode pour afficher la boîte de dialogue de confirmation
  void _showConfirmationDialog(String newStatus) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text('Confirmation'),
          content: Text('Are you sure you want to change the status to "$newStatus"?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme le dialogue
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentStatus = newStatus; // Met à jour le statut
                });
                Navigator.of(context).pop(); // Ferme le dialogue
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Confirm', style: TextStyle(color: Colors.white)),
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
                  child: Image.asset(
                    widget.incident.image,
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
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/images/map.png', // Assurez-vous que ce chemin est correct. 'lib/assets/images/map.png' n'est généralement pas le bon chemin pour les assets.
                        width: 18,
                        height: 18,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.incident.location,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.incident.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.incident.description!, // Supprimé le '!' car 'description' est requis dans le modèle
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Conteneur pour le statut initial / actuel
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: _getStatusColor(_currentStatus), // <-- Utilisez _currentStatus pour la couleur
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.solidCommentDots, size: 16, color: Colors.white), // Icône blanche pour contraste
                                const SizedBox(width: 8),
                                Text(
                                  _currentStatus, // <-- Affiche le statut actuel
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white), // Texte blanc
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Conteneur de la date
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.calendarDays, size: 16, color: Colors.black87),
                                const SizedBox(width: 8),
                                Text(
                                  DateFormat('dd MMM,yyyy').format(widget.incident.date),
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Bouton de changement de statut
                      GestureDetector(
                        onTap: _showStatusChangeSheet,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.green[800], // <-- Couleur fixe verte
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row( // <-- Utilisez const si possible
                            children: [
                              Text(
                                'Status', // <-- Texte fixe "Change Status"
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.menu, size: 16, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fonction utilitaire pour obtenir la couleur du statut
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Reported':
        return Colors.deepPurple;
      case 'In_Progress':
        return Colors.orange;
      case 'Resolved':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      case 'New': // Statut initial de l'exemple fourni
        return Colors.blueGrey;
      default:
        return Colors.grey;
    }
  }
}