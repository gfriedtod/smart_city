// Fichier : lib/widgets/incident_list_item.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../domain/dto/IncidentDto.dart';
import '../../fake_core/data/model/incident.dart';
import '../screens/onboarding/color.dart';

class IncidentcardListItem extends StatelessWidget {
  final IncidentDto incident; // Le type est maintenant 'incident'

  const IncidentcardListItem({super.key, required this.incident});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
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
            child: Image.network(
              incident.image ?? 'https://ifthknoghckblnvnkbld.supabase.co/storage/v1/object/public/avatars/56a14781-1822-4a0c-8fc8-ac985405f2071748999119692.png',
              // Accès direct à la propriété 'image' de l'objet incident
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
                  incident.name ?? 'N/A', // Accès direct à la propriété 'title'
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
                    // Utilisation de l'icône de carte comme vous l'avez spécifié
                    Image.asset(
                      'lib/assets/images/map.png',
                      // Chemin corrigé pour être relatif aux assets
                      width: 15,
                      height: 15,
                      color: Colors.blueGrey[700],
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        incident.address ?? 'N/A',
                        // Accès direct à la propriété 'location'
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
                      DateFormat('dd MMM,yyyy').format(incident.createdAt ?? DateTime.now()),
                      // Accès direct à la propriété 'date'
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 10),

                  ],
                ),
              ],
            ),
          ),
          // Bouton fléché à droite
          Align(
            alignment: Alignment.bottomRight,
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
