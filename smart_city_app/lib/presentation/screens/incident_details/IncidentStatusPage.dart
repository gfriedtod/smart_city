// Fichier : lib/pages/incident_status_page.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_city_app/domain/dto/IncidentDto.dart';

import '../../../fake_core/data/IncidentCard_data.dart';
import '../../../fake_core/data/model/incident.dart';
import '../../components/IncidentStatusCard.dart';
import '../../components/StatusFilterChip.dart'; // Pour l'icône de retour

class IncidentStatusPage extends StatefulWidget {
  const IncidentStatusPage({super.key});

  @override
  State<IncidentStatusPage> createState() => _IncidentStatusPageState();
}

class _IncidentStatusPageState extends State<IncidentStatusPage> {
  String _selectedFilter = 'All'; // Filtre sélectionné par défaut
  late List<IncidentDto> _filteredIncidents;
  late List<IncidentDto> _allIncidents; // Copie de la liste originale

  @override
  void initState() {
    super.initState();
    _allIncidents = List.from(
      IncidentArticlesData,
    ); // Copie pour pouvoir supprimer des éléments
    _filterIncidents(); // Filtrer les incidents au démarrage
  }

  void _filterIncidents() {
    setState(() {
      if (_selectedFilter == 'All') {
        _filteredIncidents = List.from(_allIncidents);
      } else if (_selectedFilter == 'Pending') {
        _filteredIncidents = _allIncidents
            .where(
              (incident) =>
                  incident.status == IncidentStatus.SUBMIT ||
                  incident.status == IncidentStatus.PROGRESS,
            )
            .toList();
      } else if (_selectedFilter == 'Treated') {
        _filteredIncidents = _allIncidents
            .where((incident) => incident.status == IncidentStatus.RESOLVED)
            .toList();
      } else if (_selectedFilter == IncidentStatus.REJECTED) {
        _filteredIncidents = _allIncidents
            .where((incident) => incident.status == IncidentStatus.REJECTED)
            .toList();
      }
    });
  }

  void _onFilterSelected(String filter) {
    setState(() {
      _selectedFilter = filter;
      _filterIncidents();
    });
  }

  void _deleteIncident(IncidentDto incidentToDelete) {
    setState(() {
      _allIncidents.remove(incidentToDelete); // Supprime de la liste principale
      _filterIncidents(); // Re-filtre pour mettre à jour l'affichage
    });
    // Optionnel: Afficher un SnackBar ou une confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Incident "${incidentToDelete.name ?? 'N/A'}" supprimé.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Statut d\'incidents',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        elevation: 0, // Pas d'ombre pour un look plat
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Container(
              // Le conteneur principal pour la barre segmentée
              height: 45, // Hauteur de la barre
              decoration: BoxDecoration(
                color: Colors.grey[200], // Couleur de fond de la barre
                borderRadius: BorderRadius.circular(
                  25,
                ), // Coins arrondis de la barre
                border: Border.all(color: Colors.grey[300]!), // Bordure légère
              ),
              child: Row(
                // La Row pour les segments
                children: [
                  _buildSegmentedFilterButton('All'),
                  _buildSegmentedFilterButton('Pending'),
                  _buildSegmentedFilterButton('Treated'),
                  _buildSegmentedFilterButton(
                    'Rejected',
                  ), // Ajoutez Rejected ici si vous voulez 4 segments
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Text(
              'Mes incidents',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: _filteredIncidents.isEmpty
                ? const Center(
                    child: Text(
                      'Aucun incident trouvé pour ce statut.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 10.0,
                    ),
                    itemCount: _filteredIncidents.length,
                    itemBuilder: (context, index) {
                      final incident = _filteredIncidents[index];
                      return IncidentStatusCard(
                        incident: incident,
                        onDelete: () => _deleteIncident(
                          incident,
                        ), // Passer le callback de suppression
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentedFilterButton(String label) {
    bool isSelected = _selectedFilter == label;
    return Expanded(
      // Permet à chaque segment de prendre une part égale de l'espace
      child: GestureDetector(
        onTap: () => _onFilterSelected(label),
        child: Container(
          alignment: Alignment.center, // Centre le texte
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF2C5E2E)
                : Colors.transparent, // Couleur verte pour sélection
            borderRadius: BorderRadius.circular(
              20,
            ), // Coins arrondis pour le segment sélectionné
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
