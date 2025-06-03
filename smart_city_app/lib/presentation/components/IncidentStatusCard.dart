// Fichier : lib/widgets/incident_status_card.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../fake_core/data/model/incident.dart';

// Assurez-vous que ce chemin est correct



class IncidentStatusCard extends StatelessWidget {
  final Incident incident;
  final VoidCallback onDelete; // Callback pour le bouton de suppression

  const IncidentStatusCard({
    super.key,
    required this.incident,
    required this.onDelete,
  });

  // Fonction utilitaire pour obtenir la couleur du statut
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Reported':
        return Colors.deepPurple;
      case 'In_Progress':
        return Colors.orange;
      case 'Resolved': // Ancien 'Resolved'
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // Fonction utilitaire pour obtenir la valeur de progression (pour la barre)
  double _getProgressValue(String status) {
    switch (status) {
      case 'Reported':
        return 0.33; // ~33%
      case 'In_Progress':
        return 0.66; // ~66%
      case 'Resolved':
        return 1.0; // 100%
      default:
        return 0.0; // Pour Rejected ou autres, pas de progression affichée
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showProgressBar = incident.initialStatus != 'Rejected';

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.09),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
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
              incident.image,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          // Détails au centre
          Expanded( // Cet Expanded est crucial pour que la colonne prenne l'espace restant
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  incident.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset(
                      'lib/assets/images/map.png', // Assurez-vous que le chemin est correct
                      width: 15,
                      height: 15,
                      color: Colors.blueGrey[700],
                    ),
                    const SizedBox(width: 5),
                    Expanded( // Utilisez Expanded pour la location pour qu'elle prenne l'espace restant
                      child: Text(
                        incident.location,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (showProgressBar) // Affiche la barre de progression si ce n'est pas "Rejected"
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: LinearProgressIndicator(
                      value: _getProgressValue(incident.initialStatus!), // Supprimé le '!'
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getStatusColor(incident.initialStatus!), // Supprimé le '!'
                      ),
                      minHeight: 6.9,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                Row(
                  // La Row qui contient le badge, la date et le bouton de suppression
                  // Elle doit gérer l'espacement pour éviter le débordement
                  children: [
                    // Badge de statut
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getStatusColor(incident.initialStatus!).withOpacity(0.15), // Supprimé le '!'
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.circle,
                                  size: 8,
                                  color: _getStatusColor(incident.initialStatus!),
                              ),
                              SizedBox(width: 5),
                              Text(
                                incident.initialStatus!, // Supprimé le '!'
                                style:  TextStyle(
                                  color: _getStatusColor(incident.initialStatus!),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    // Date
                    const Icon( // Utilisation de Icon de Material Design
                      Icons.calendar_today, // Icône de calendrier Material Design
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    // Utilisez Expanded pour la date si elle doit prendre l'espace restant
                    // Ou donnez une largeur fixe si vous êtes sûr qu'elle tiendra
                    Expanded( // Remplacé Container par Expanded
                      child: Text(
                        DateFormat('dd MMM,yyyy').format(incident.date),
                        style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Bouton de suppression à droite
                    // Enveloppez-le dans un SizedBox pour lui donner une taille fixe
                    SizedBox(
                      width: 40, // Taille fixe pour le bouton de suppression
                      height: 40,
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red[600], size: 24),
                        onPressed: onDelete,
                        padding: EdgeInsets.zero, // Retire le padding par défaut de l'IconButton
                        alignment: Alignment.center, // Centre l'icône dans son SizedBox
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}